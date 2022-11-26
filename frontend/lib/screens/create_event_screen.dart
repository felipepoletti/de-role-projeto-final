import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:store_api_flutter_course/widgets/create_event_form.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: const [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Crie o seu Role",
                style: TextStyle(
                    color: Color(0xff686868),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            SizedBox(height:40),
            CreateEventForm()
          ],
        ),
    );
  }


}
