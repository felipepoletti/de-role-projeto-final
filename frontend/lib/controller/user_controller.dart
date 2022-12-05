import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/UserModel.dart';

class UserController {
  static Future<bool> login(String user, String password) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {"Content-type": "application/json"};
    Map params = {"email": user, "password": password};
    var body = json.encode(params);
    try {
      final response = await dio.post(
          'https://10.0.2.2:7263/derole/Login/authenticate',
          data: body,
          options: Options(headers: headers));
      await prefs.setString("access_token", response.data["access_token"]);
      await prefs.setInt("user_id", response.data["id"]);
      valid = true;
    } on DioError catch (e) {
      print(e.response);
    }
    ;

    return valid;
  }

  static Future<bool> updateUser(UserModel userModel) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    Map params = userModel.toMap();
    var body = json.encode(params);
    try {
      final response = await dio.put('https://10.0.2.2:7263/derole/User',
          data: body, options: Options(headers: headers));
      valid = true;
    } on DioError catch (e) {
      print(e.response);
    }
    ;

    return valid;
  }

  static Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt("user_id");

    return userId!;
  }

  static Future<bool> registerUser(UserModel userModel) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {"Content-type": "application/json"};
    Map params = userModel.toMap();
    var body = json.encode(params);
    try {
      final response = await dio.post('https://10.0.2.2:7263/derole/User',
          data: body, options: Options(headers: headers));

      valid = true;
    } on DioError catch (e) {
      print(e.response);
    }
    ;

    return valid;
  }

  static Future<UserModel> getUser(int idUser) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    Map? responseBody;
    late UserModel user;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };

    try {
      final response = await dio.get(
          'https://10.0.2.2:7263/derole/User/$idUser',
          options: Options(headers: headers));
      responseBody = response.data;
      user = UserModel.fromJson(responseBody?.entries.first.value);
    } on DioError catch (e) {
      print(e.response);
    }
    ;

    return user;
  }
}
