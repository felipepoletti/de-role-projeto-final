import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/screens/create_event_screen.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';

import '../controller/event_controller.dart';
import '../models/EventModel.dart';

class EventDescriptionScreen extends StatefulWidget {
  const EventDescriptionScreen({super.key, required this.id});
  final int? id;
  @override
  State<EventDescriptionScreen> createState() => _EventDescriptionScreenState();
}

class _EventDescriptionScreenState extends State<EventDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildBottomNavigationBar(),
        body:FutureBuilder<EventModel>(
            future:EventController.getEventDescription(widget?.id),
            builder: (BuildContext context, AsyncSnapshot<EventModel> snapshot) {
              var response;

              if(snapshot.hasData) {
                response = snapshot.data;
              }
              return ListView(
                  children: [
                    buildBannerImage(),
                    const SizedBox(height: 20),
                    Row(
                      children:  [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              response.eventName,
                              style: const TextStyle(
                                color: Color(0xff585252),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children:  [
                        Expanded(
                            flex: 6,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "${response.address} ${response.addressNumber} ${response.addressComplement},${response.addressDistrict}",
                                style: const TextStyle(
                                    color: Color(0xff585252),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Text(
                              response.price > 0 ? "R\$${response.price.toString()}" : "Gratuito",
                              style: const TextStyle(
                                  color: Color(0xffF7C548),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 14),
                    buildWrappCategoriesBox(response.eventType),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child:  Text(
                        "Descrição",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        response.eventDescription,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),

                  ],
                );

            }
        ),
        );
  }

  Padding buildWrappCategoriesBox(String categoria) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  children: [
                    buildCategoriesBox(Colors.red, categoria),

                  ],
                ),
            );
  }

  Container buildCategoriesBox(Color color, String text) {
    return Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: color,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: _onTap,
      selectedItemColor: const Color(0xffF7C548),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(IconlyBold.home),
            label: ""
        ),
        BottomNavigationBarItem(
            icon: Icon(IconlyBold.addUser),
            label: ""
        ),
      ],

    );
  }
  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen())
        );
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CreateEventScreen())
        );
        break;
    }

  }

  Row buildBannerImage() {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.asset("assets/images/placeholder-img.jpg",
                  fit: BoxFit.cover, width: double.infinity, height: 250)
            ],
          ),
        )
      ],
    );
  }
}
