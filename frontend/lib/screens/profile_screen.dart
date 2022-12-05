import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_api_flutter_course/controller/user_controller.dart';
import 'package:store_api_flutter_course/models/UserModel.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';
import 'package:store_api_flutter_course/widgets/card_events_home.dart';

import '../controller/event_controller.dart';
import '../models/EventModel.dart';
import 'create_event_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var userModel;

  bool disabledUser = true;
  final snackbarSucessUpdateUser = const SnackBar(
    content: SizedBox(
      height: 80,
      child: Align(
          alignment: Alignment.center,
          child: Text("Usuario atualizado com sucesso.",
              style: TextStyle(fontSize: 20, color: Colors.white))),
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 1),
  );

  final snackbarError = const SnackBar(
    content: SizedBox(
      height: 80,
      child: Align(
          alignment: Alignment.center,
          child: Text("Email e/ou senhas inválidos.",
              style: TextStyle(fontSize: 20, color: Colors.white))),
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Loader.show(context, progressIndicator: LinearProgressIndicator());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Column(
        children: [
          FutureBuilder<int>(
              future: UserController.getUserId(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                Loader.isShown;

                var responseIdUser;
                if (snapshot.hasData) {

                  responseIdUser = snapshot.data! ;
                  Future.delayed(const Duration(seconds: 2));

                }

                return responseIdUser != null ? FutureBuilder<UserModel>(
                    future: UserController.getUser(responseIdUser),
                    builder: (BuildContext context,
                        AsyncSnapshot<UserModel> snapshot) {
                      if (snapshot.hasData) {
                        userModel = snapshot.data;

                        _nameController.text = snapshot.data?.name as String;
                        _emailController.text = snapshot.data?.email as String;
                        Loader.hide();
                      }
                      return Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Text("Nome"),
                              TextFormField(
                                controller: _nameController,
                              ),
                              const Text("Email"),
                              TextFormField(
                                controller: _emailController,
                              ),
                              buildSaveRegistterBtn(),
                            ],
                          ));
                    }) : Text("Erro");
              }),
          const SizedBox(height: 20),
          const Divider(
            height: 3,
            thickness: 1,
            endIndent: 0,
            color: Colors.black,
          ),
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.center,
            child: Text("Seus eventos"),
          ),
          Expanded(
            child: FutureBuilder<List<EventModel>>(
                future: EventController.getEvent("Musicais"),
                builder: (BuildContext context, AsyncSnapshot<List<EventModel>> eventoListResponse) {
                  var data;
                  if(eventoListResponse.hasData) {
                    data= eventoListResponse.data;
                  }
                  return data != null ? ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      var item= data[index];
                      return SizedBox(
                        child: CardEventsHome(eventModel: item,edit: true),
                      );
                    },
                  )
                      : Text("Nada encontrado");
                }
            ),
          ),

        ],
      ),
    );
  }

  Future<void> validatUpdateForm() async {
    if (_formKey.currentState!.validate()) {
      Loader.isShown;
      var response = await UserController.updateUser(UserModel(
          id: userModel.id,
          name: _nameController.text,
          email: _emailController.text,
          password: userModel.password));
      if (response == true) {
        Loader.hide();
        ScaffoldMessenger.of(context).showSnackBar(snackbarSucessUpdateUser);
        await Future.delayed(const Duration(seconds: 1));
      } else {
        Loader.hide();

        ScaffoldMessenger.of(context).showSnackBar(snackbarError);
      }
    }
  }

  SizedBox buildSaveRegistterBtn() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          validatUpdateForm();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF7C548),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "SALVAR",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 2,
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

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CreateEventScreen(editEvent: false)));
        break;
    }
  }
}
