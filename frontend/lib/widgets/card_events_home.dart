import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:store_api_flutter_course/models/EventModel.dart';
import 'package:store_api_flutter_course/screens/create_event_screen.dart';

class CardEventsHome extends StatefulWidget {
  final EventModel? eventModel;
  final bool edit;
  const CardEventsHome(
      {super.key, required this.eventModel, required this.edit});

  @override
  State<CardEventsHome> createState() => _CardEventsHomeState();
}

class _CardEventsHomeState extends State<CardEventsHome> {
  @override
  Widget build(BuildContext context) {
    var eventName = widget.eventModel?.eventName;
    var price = widget.eventModel?.price;
    var address = widget.eventModel?.address;
    var time = widget.eventModel?.time;
    var addressNumber = widget.eventModel?.addressNumber;
    var addressComplement = widget.eventModel?.addressComplement;
    var addressDistrict = widget.eventModel?.addressDistrict;

    return SizedBox(
      child: Column(
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: const BorderSide(width: 4, color: Color(0xffE3E3E3))),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset("assets/images/placeholder-img.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100)
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventName!,
                            style: const TextStyle(
                              color: Color(0xff585252),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "$address $addressNumber $addressComplement,$addressDistrict",
                            style: const TextStyle(
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(height: 30),
                              Expanded(
                                  child: Text(
                                time!,
                                style: const TextStyle(
                                    color: Color(0xffF7C548),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                              Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      price! > 0
                                          ? price.toString().replaceAll(".", ",")
                                          : 'Gratuito',
                                      style: const TextStyle(
                                          color: Color(0xffF7C548),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                ),
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.edit) ...[
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>  CreateEventScreen(editEvent: true,  eventModelEdit: widget.eventModel!)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:const Color(0xffF7C548),
                    ),
                    child: const Text(
                      "Editar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  )),
            )

          ] else ...[
            const SizedBox()
          ]
        ],
      ),
    );
  }
}
