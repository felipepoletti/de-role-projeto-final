import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/widgets/card_events_home.dart';
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
          body: Padding(
              padding: const EdgeInsets.all(18.0),
              child:Column(children: [
                Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo-reduzido.png"), fit: BoxFit.contain )
                    )
                ),
                const SizedBox(height: 20),
                buildInputSearchHome(),
                RichText(
                  text: const TextSpan(
                    text: "filtrar",
                    style: TextStyle(
                      color: Color(0xff585252),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                    children: [
                      WidgetSpan(child: Icon(
                         IconlyBold.filter
                      ),
                      ),
                    ]
                  ),
                ),
                const Text(
                  "Eventos mais curtidos por categoria",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Música"
                ),
               CardEventsHome(),

              ],
              ),
          ),
        bottomNavigationBar: buildBottomNavigationBar() ,
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
        selectedItemColor: const Color(0xffF7C548),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconlyBold.home),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(IconlyBold.upload),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(IconlyBold.user2),
              label: ""
          ),
        ],

      );
  }

}
