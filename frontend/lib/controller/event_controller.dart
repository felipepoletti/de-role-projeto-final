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

  static Future<List<EventModel>> getEvent(String eventType) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    Response<Map> response;
    var eventList;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    try {

      response = await dio.get('https://10.0.2.2:7263/derole/Event/filter/${eventType}', options: Options(headers: headers));
      eventList =  (response.data?.values.first as  List)
          .map((data) => EventModel.fromJson(data))
          .toList();
    } on DioError catch (e) {
      print(e.response);
    };

    return eventList;
  }
  static Future<List<EventModel>> getEventById() async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    Response<Map> response;
    var eventList;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    try {

      response = await dio.get('https://10.0.2.2:7263/derole/Event/users/${prefs.getInt("user_id")}', options: Options(headers: headers));
      eventList =  (response.data?.values.first as  List)
          .map((data) => EventModel.fromJson(data))
          .toList();
    } on DioError catch (e) {
      print(e.response);
    };

    return eventList;
  }
  static Future<EventModel> getEventDescription(int? id) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    Response<Map> response;
    Map? responseBody;
    late EventModel event;

    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    try {

      response = await dio.get('https://10.0.2.2:7263/derole/Event/${id}', options: Options(headers: headers));
      responseBody = response.data;
      event = EventModel.fromJson(responseBody?.entries.first.value);


    } on DioError catch (e) {
      print(e.response);
    };

    return event;
  }
  static Future<List<EventModel>> getEventList(String name) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    Response<Map> response;
    var eventList;

    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    try {

      response = await dio.get('https://10.0.2.2:7263/derole/Event/search/${name}', options: Options(headers: headers));

      eventList =  (response.data?.values.first as  List)
          .map((data) => EventModel.fromJson(data))
          .toList();
    } on DioError catch (e) {
      print(e.response);
    };

    return eventList;
  }

  static Future<bool> updateEvent(EventModel eventModel) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    bool valid = false;
    var headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access_token")}"
    };
    Map params = eventModel.toMap();
    var body = json.encode(params);
    try {
      final response = await dio.put('https://10.0.2.2:7263/derole/Event',data: body, options: Options(headers: headers));
      print(response);
      valid = true;
    } on DioError catch (e) {
      print(e.response);
    };


    return valid;
  }
}