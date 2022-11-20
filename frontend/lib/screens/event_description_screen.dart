import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';

class EventDescriptionScreen extends StatefulWidget {
  const EventDescriptionScreen({Key? key}) : super(key: key);

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
        body: ListView(
          children: [
            buildBannerImage(),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Felipe no Céu Bar + Arte",
                        style: TextStyle(
                          color: Color(0xff585252),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(IconlyBold.heart),
                  )
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Bom fim, Porto Alegre",
                        style: TextStyle(
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
                        "R\$10",
                        style: TextStyle(
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
            buildWrappCategoriesBox(),
            const SizedBox(height: 30),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child:  const Text(
                  "Descrição",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra aliquet eget sit amet tellus. Proin libero nunc consequat interdum. Vel orci porta non pulvinar neque laoreet suspendisse. Urna duis convallis convallis tellus id interdum velit. At elementum eu facilisis sed odio. Neque ornare aenean euismod elementum nisi quis eleifend. Habitant morbi tristique senectus et netus et malesuada fames ac. Egestas sed sed risus pretium quam vulputate dignissim suspendisse. Eget duis at tellus at. Lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Vel facilisis volutpat est velit egestas. Orci nulla pellentesque dignissim enim sit amet venenatis. Velit ut tortor pretium viverra suspendisse potenti."
                    "Sem integer vitae justo eget magna. Diam vel quam elementum pulvinar etiam non quam. Porttitor lacus luctus accumsan tortor posuere ac ut. Aliquam id diam maecenas ultricies mi eget mauris pharetra. Amet mauris commodo quis imperdiet massa. Potenti nullam ac tortor vitae purus. Ac turpis egestas maecenas pharetra. Elementum nisi quis eleifend quam adipiscing vitae proin. Facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum. Lectus urna duis convallis convallis. Lacus vestibulum sed arcu non odio."
                    "Nec ullamcorper sit amet risus nullam eget. Ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum. Sed euismod nisi porta lorem. Tincidunt lobortis feugiat vivamus at augue eget arcu dictum. Sed augue lacus viverra vitae congue. Vitae tortor condimentum lacinia quis vel eros donec ac odio. Aliquam eleifend mi in nulla posuere sollicitudin aliquam ultrices. Ipsum a arcu cursus vitae congue mauris. Turpis cursus in hac habitasse. Purus in mollis nunc sed id semper."
                    "Fermentum leo vel orci porta non pulvinar neque. Adipiscing at in tellus integer feugiat scelerisque. Sem et tortor consequat id porta nibh. Integer eget aliquet nibh praesent tristique magna. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Odio ut sem nulla pharetra diam sit amet nisl. A pellentesque sit amet porttitor eget dolor morbi non arcu. Id leo in vitae turpis massa sed. Nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit. Turpis nunc eget lorem dolor sed viverra. Dignissim enim sit amet venenatis urna. Pellentesque pulvinar pellentesque habitant morbi. Mauris pharetra et ultrices neque ornare aenean euismod. Bibendum enim facilisis gravida neque convallis. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Libero justo laoreet sit amet cursus sit."
                    "Nisl purus in mollis nunc sed id semper risus in. Etiam tempor orci eu lobortis elementum nibh tellus molestie nunc. Ipsum suspendisse ultrices gravida dictum. Cras ornare arcu dui vivamus arcu felis bibendum. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac. Mauris a diam maecenas sed enim. Sit amet nisl suscipit adipiscing bibendum. Tincidunt tortor aliquam nulla facilisi cras. Aliquet nec ullamcorper sit amet risus nullam. Est ante in nibh mauris cursus mattis molestie. Facilisi cras fermentum odio eu. A iaculis at erat pellentesque adipiscing commodo. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Purus sit amet volutpat consequat mauris nunc congue nisi. Vestibulum mattis ullamcorper velit sed ullamcorper morbi. Dui accumsan sit amet nulla facilisi. Ut lectus arcu bibendum at varius vel. Viverra mauris in aliquam sem fringilla ut morbi.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

          ],
        ));
  }

  Padding buildWrappCategoriesBox() {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  children: [
                    buildCategoriesBox(Colors.red, "teatro"),
                    buildCategoriesBox(Colors.yellow, "música"),
                    buildCategoriesBox(Colors.brown, "música"),
                    buildCategoriesBox(Colors.blue, "cultura"),
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

      type: BottomNavigationBarType.fixed,

      selectedItemColor: const Color(0xffF7C548),
      onTap: _onTap,
      items: const [

        BottomNavigationBarItem(
            icon: Icon(IconlyBold.home),
            label: "",

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
  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen())
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
