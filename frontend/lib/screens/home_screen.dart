import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/controller/event_controller.dart';
import 'package:store_api_flutter_course/screens/create_event_screen.dart';
import 'package:store_api_flutter_course/screens/event_description_screen.dart';
import 'package:store_api_flutter_course/widgets/card_events_home.dart';

import '../models/EventModel.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();
          },
        child: Scaffold(
              backgroundColor:  Colors.white,
              resizeToAvoidBottomInset : false,
              body: Container(
                padding: const EdgeInsets.all(18.0),
                child: ListView(
                  children: [

                    Container(
                        height: 70,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo-reduzido.png"), fit: BoxFit.contain )
                        )
                    ),
                    const SizedBox(height: 30),

                    buildInputSearchHome(),
                    const SizedBox(height: 20),
                    buildFilterBtn(),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Eventos mais curtidos por categoria",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xff585252)
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    buildTitleCardHome("Música"),
                    FutureBuilder<EventModel>(
                        future:EventController.getEvent("Musicais"),
                        builder: (BuildContext context, AsyncSnapshot<EventModel> snapshot) {
                          if(snapshot.hasData){

                            buildTitleCardHome("Música");
                          }else if (snapshot.hasError){
                            buildTitleCardHome("aaaaa2");


                          }else{
                            buildTitleCardHome("aaa");

                          }

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => const EventDescriptionScreen())
                              );
                            },
                            child: CardEventsHome(),
                          );

                        }
                    ),


                    const SizedBox(height: 38),
                    buildTitleCardHome("Teatro"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const EventDescriptionScreen())
                        );
                      },
                      child: CardEventsHome(),
                    ),
                    const SizedBox(height: 38),
                    buildTitleCardHome("Exposição"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const EventDescriptionScreen())
                        );
                      },
                      child: CardEventsHome(),
                    ),
                  ],
                ),
              ),
          bottomNavigationBar: buildBottomNavigationBar() ,
        )
    );

  }

  Align buildTitleCardHome(String title) {
    return  Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 34,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff585252)
                    ),
                  ),
                )
              );
  }

  Align buildFilterBtn() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: const TextSpan(
            text: "filtrar",
            style: TextStyle(
                color: Color(0xff585252),
                fontSize: 23,
                fontWeight: FontWeight.bold
            ),
            children: [

              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 28,
                      child: Icon(
                          IconlyBold.filter,
                          color: Color(0xff585252),
                          size: 30
                      ),
                    )
                ),
              ),
            ]
        ),
      )
    );
  }

  SizedBox buildInputSearchHome() {
    return SizedBox(
                height: 60,
                child: TextField(
                  decoration:  InputDecoration(
                    suffixIcon: const Icon(IconlyLight.search, size: 26,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:  const BorderSide(width: 3, color: Color(0xffE3E3E3))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(width: 4, color: Color(0xffE3E3E3))
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:  const BorderSide(width: 3, color: Colors.red),

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
          BottomNavigationBarItem(
              icon: Icon(IconlyBold.user2),
              label: ""
          ),
        ],

      );
  }
  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CreateEventScreen())
        );
        break;
    }

  }

}
