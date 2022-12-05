import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/EventModel.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';

import 'package:store_api_flutter_course/widgets/create_event_form.dart';

class CreateEventScreen extends StatefulWidget {

  const CreateEventScreen({super.key, required this.editEvent, this.eventModelEdit});
  final bool editEvent;
  final EventModel?  eventModelEdit;
  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children:  [

            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen())
                );

                },
                child: const Icon(
                  Icons.arrow_left,
                  size: 80,
                  color: Color(0xffF7C548),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.center,
              child: Text(
                "Crie o seu Role",
                style: TextStyle(
                    color: Color(0xff686868),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),

            const SizedBox(height:40),
            if (widget.editEvent) ...[
              CreateEventForm(editEvent: true, eventModel: widget.eventModelEdit)

            ] else ...[
              const CreateEventForm(editEvent: false)

            ]

          ],
        ),
    );
  }


}
