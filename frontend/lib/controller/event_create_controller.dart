import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventCreateController{
  var dio = Dio();

  Future<bool> createEvent(String eventoNome, double eventoPreco, String eventoDescricao,
      String eventoData, String eventoHora, String eventoEndereco,
      String eventoEnderecoNumero, String eventoEnderecoComplemento, String eventoTipo) async {
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {
      "Content-type": "application/json"
    };
    Map params = {
      "id": null,
      "evento_name": eventoNome,
      "evento_preco": eventoPreco,
      "evento_descricao":eventoDescricao,
      "evento_data":eventoData,
      "evento_hora":eventoHora,
      "evento_endereco":eventoEndereco,
      "evento_endereco_numero":eventoEnderecoNumero,
      "evento_endereco_complemento":eventoEnderecoComplemento,
      "evento_tipo":eventoTipo,
      "userId":1

    };
    var body = json.encode(params);
    try {
      print(body);

      final response = await dio.post('https://10.0.2.2:7263/derole/Event',data: body, options: Options(headers: headers));
      print(response);


    } on DioError catch (e) {
      print(e.response);
    };


    return valid;
  }
}