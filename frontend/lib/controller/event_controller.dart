import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/EventModel.dart';

class EventController{


  static Future<bool> createEvent(EventModel createEventDTO) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    Map params = createEventDTO.toMap();
    var body = json.encode(params);
    try {
      final response = await dio.post('https://10.0.2.2:7263/derole/Event',data: body, options: Options(headers: headers));
      valid = true;
    } on DioError catch (e) {
      print(e.response);
    };


    return valid;
  }

  static Future<EventModel> getEvent(String eventType) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    var response =null;
    bool valid = false;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    try {
      response = await dio.get('https://10.0.2.2:7263/derole/Event/filter/${eventType}', options: Options(headers: headers));
      valid = true;
    } on DioError catch (e) {
      print(e.response);
    };


    return EventModel.fromJson(response.data);
  }
}