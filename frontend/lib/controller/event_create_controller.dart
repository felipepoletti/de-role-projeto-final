import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventCreateController{
  var dio = Dio();

  Future<bool> createEvent(String eventoNome, double eventoPreco, String eventoDescricao,
      String eventoData, String eventoHora, String eventoEndereco,
      String eventoEnderecoNumero, String eventoEnderecoComplemento, String eventoTipo, String bairro) async {
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    Map params = {
      "id": 0,
      "eventName": eventoNome,
      "price": eventoPreco,
      "eventDescription": eventoDescricao,
      "date": eventoData,
      "time": eventoHora,
      "address": eventoEndereco,
      "addressNumber": eventoEnderecoNumero,
      "addressComplement": eventoEnderecoComplemento,
      "addressDistrict": bairro,
      "eventType": eventoTipo,
      "userId":1

    };
    var body = json.encode(params);
    try {


      final response = await dio.post('https://10.0.2.2:7263/derole/Event',data: body, options: Options(headers: headers));
      print(response);
      valid = true;


    } on DioError catch (e) {
      print(e.response);
    };


    return valid;
  }
}