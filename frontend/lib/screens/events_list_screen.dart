import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/models/EventModel.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';
import 'package:store_api_flutter_course/widgets/card_events_home.dart';

import 'event_description_screen.dart';

class EventListScreen extends StatefulWidget {
  final List<EventModel> eventList;

  const EventListScreen({super.key, required this.eventList});
  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: widget.eventList.length,
        itemBuilder: (context, index) {
          var item = widget.eventList[index];

          return Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => EventDescriptionScreen(id: item.id)));
              },
              child: Expanded(child: CardEventsHome(eventModel: item, edit: false)),
            ),
          );
        },
      ),
      appBar: AppBar(
          titleSpacing: 0.0,
          title: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                    size: 60,
                  )),
              const Text(
                "Listagem de eventos",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
