import 'dart:convert' as convert;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController{
  var dio = Dio();

  Future<bool> login(String user, String password) async {
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {
      "Content-type": "application/json"
    };
    Map params = {
      "email": user,
      "password": password
    };
    var body = json.encode(params);
    try {
      final response = await dio.post('https://10.0.2.2:7263/derole/Login/authenticate',data: body, options: Options(headers: headers));
      await prefs.setString("access_token", response.data["access_token"]);
      await prefs.setInt("user_id", response.data["id"]);
      valid = true;

    } on DioError catch (e) {
      print(e.response);
    };


    return valid;
  }
  Future<bool> registerUser(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {
      "Content-type": "application/json"
    };
    Map params = {
      "name": name,
      "email": email,
      "password": password
    };
    var body = json.encode(params);
    try {
      final response = await dio.post('https://10.0.2.2:7263/derole/User',data: body, options: Options(headers: headers));

      print(response);
      valid = true;

    } on DioError catch (e) {
      print(e.response);
    };


    return valid;
  }
}