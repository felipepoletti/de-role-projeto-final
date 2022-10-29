import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'register_screen.dart';
import '../widgets/login_form.dart';

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
                 Text("Home")
              ],
              ),
          ),
    )
    );

  }

}
