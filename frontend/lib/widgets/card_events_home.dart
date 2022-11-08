import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
class CardEventsHome extends StatefulWidget {
  const CardEventsHome({Key? key}) : super(key: key);

  @override
  State<CardEventsHome> createState() => _CardEventsHomeState();
}

class _CardEventsHomeState extends State<CardEventsHome> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: const BorderSide(
          width: 4,
          color: Color(0xffE3E3E3)
        )
      ),
      child: Row(

        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset("assets/images/placeholder-img.jpg",fit:BoxFit.cover,width: double.infinity, height: 100)
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     const Text(
                      "Feira na Orla do Guaíba",
                      style: TextStyle(
                        color: Color(0xff585252),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                        "Centro Histórico, Porto Alegre",
                        style: TextStyle(
                        color: Color(0xff878787),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        ),
                    ),
                    Row(
                      children: const [
                        SizedBox(height: 30),
                        Expanded(
                            child: Text(
                              '14',
                              style: TextStyle(
                                color: Color (0xffF7C548),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ) ,
                            )
                        ),
                        Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Gratuito',
                                style: TextStyle(
                                    color: Color (0xffF7C548),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
            child: Padding(
                padding: EdgeInsets.only(top: 14, right: 6),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(IconlyBold.heart),
              ),
            )
          ),

        ],
      ),
    );
  }
}
