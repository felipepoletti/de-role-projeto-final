import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/EventModel.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key, required this.eventList});
  final List<EventModel> eventList;
  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

      ],
    );
  }
}