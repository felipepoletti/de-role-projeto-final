import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:store_api_flutter_course/models/EventModel.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';
import 'package:store_api_flutter_course/screens/profile_screen.dart';

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
      resizeToAvoidBottomInset: true,

      bottomNavigationBar: buildBottomNavigationBar(),
      body: ListView(
          children:  [
            const SizedBox(height: 30),
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

            const SizedBox(height:20),
            if (widget.editEvent) ...[
              CreateEventForm(editEvent: true, eventModel: widget.eventModelEdit)
            ] else ...[
              const CreateEventForm(editEvent: false)
            ]
          ],
        ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.fixed,
      onTap: _onTap,
      selectedItemColor: const Color(0xffF7C548),
      items: const [
        BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: ""),
        BottomNavigationBarItem(icon: Icon(IconlyBold.addUser), label: ""),
        BottomNavigationBarItem(icon: Icon(IconlyBold.user2), label: ""),
      ],
    );
  }

  _onTap(int tabIndex) async {

    switch (tabIndex) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
    }
  }

}
