import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_api_flutter_course/controller/event_controller.dart';
import 'package:store_api_flutter_course/screens/create_event_screen.dart';
import 'package:store_api_flutter_course/screens/event_description_screen.dart';
import 'package:store_api_flutter_course/screens/events_list_screen.dart';
import 'package:store_api_flutter_course/screens/profile_screen.dart';
import 'package:store_api_flutter_course/widgets/card_events_home.dart';

import '../models/EventModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchEvents = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Loader.hide();
    _searchEvents.dispose();
    super.dispose();
  }

  final snackbarError = const SnackBar(
    content: SizedBox(
      height: 80,
      child: Align(
          alignment: Alignment.center,
          child: Text("Parametros de busca invalidos",
              style: TextStyle(fontSize: 20, color: Colors.white))),
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
  );

  @override
  Widget build(BuildContext context) {
    Loader.show(context,
        progressIndicator: LinearProgressIndicator());
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                Container(
                    height: 70,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/logo-reduzido.png"),
                            fit: BoxFit.contain))),
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
                        color: Color(0xff585252)),
                  ),
                ),
                const SizedBox(height: 28),
                buildTitleCardHome("Musicais"),
                const SizedBox(height: 12),
                FutureBuilder<List<EventModel>>(
                    future: EventController.getEvent("Musicais"),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<EventModel>> snapshot) {
                      var response;

                      Loader.isShown;

                      if (snapshot.hasData) {
                        response = snapshot.data;
                        Loader.hide();
                      }
                      return response != null
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventDescriptionScreen(
                                                id: snapshot.data?.first.id)));
                              },
                              child: CardEventsHome(eventModel: response.first,edit: false),
                            )
                          : Text("Item nao encontrado");
                    }),
                const SizedBox(height: 38),
              ],
            ),
          ),
          bottomNavigationBar: buildBottomNavigationBar(),
        ));
  }

  Align buildTitleCardHome(String title) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 34,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff585252)),
          ),
        ));
  }

  Future<void> searchEvents() async {
    if (_searchEvents != null) {
      var response = await EventController.getEventList(_searchEvents.text);
      if (response != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => EventListScreen(eventList: response)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackbarError);
      }
    }
  }

  Future<void> filterEvents() async {
    if (_searchEvents != null) {
      var response = await EventController.getEventList(_searchEvents.text);
      if (response != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => EventListScreen(eventList: response)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackbarError);
      }
    }
  }

  Future<void> filterEventsFiltered(String eventType) async {
    if (eventType != null) {
      var response = await EventController.getEvent(eventType);
      if (response != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => EventListScreen(eventList: response)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackbarError);
      }
    }
  }

  Align buildFilterBtn() {
    return Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          child: RichText(
            text: const TextSpan(
                text: "filtrar",
                style: TextStyle(
                    color: Color(0xff585252),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
                children: [
                  WidgetSpan(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 28,
                          child: Icon(IconlyBold.filter,
                              color: Color(0xff585252), size: 30),
                        )),
                  ),
                ]),
          ),
        ));
  }

  SizedBox buildInputSearchHome() {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: _searchEvents,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              searchEvents();
            },
            child: const Icon(IconlyLight.search, size: 26),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(width: 3, color: Color(0xffE3E3E3))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(width: 4, color: Color(0xffE3E3E3))),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 3, color: Colors.red),
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
        BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: ""),
        BottomNavigationBarItem(icon: Icon(IconlyBold.addUser), label: ""),
        BottomNavigationBarItem(icon: Icon(IconlyBold.user2), label: ""),
      ],
    );
  }

  _onTap(int tabIndex) async {

    switch (tabIndex) {
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CreateEventScreen(editEvent: false)));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
        Loader.hide();
        break;
    }
  }

  Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("user_id");
    return userId!;
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Selecione uma categoria para filtrar a sua busca.',
        style: TextStyle(fontSize: 24),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildFilterOptions("Musicais"),
            const SizedBox(height: 12),
            buildFilterOptions("Museu"),
            const SizedBox(height: 12),
            buildFilterOptions("Feiras"),
            const SizedBox(height: 12),
            buildFilterOptions("Teatro"),
            const SizedBox(height: 12),
            buildFilterOptions("Religião"),
            const SizedBox(height: 12),
            buildFilterOptions("Festivais"),
            const SizedBox(height: 12),
            buildFilterOptions("Dança"),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffF7C548))),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Fechar',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ],
    );
  }

  GestureDetector buildFilterOptions(String filterChoice) {
    return GestureDetector(
      onTap: () {
        filterEventsFiltered(filterChoice);
      },
      child: Text(filterChoice,
          style: const TextStyle(
            color: Color(0xffF7C548),
            fontWeight: FontWeight.bold,
            fontSize: 26,
            decoration: TextDecoration.underline,
          )),
    );
  }
}
