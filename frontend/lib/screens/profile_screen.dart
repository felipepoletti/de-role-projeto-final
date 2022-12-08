import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
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
  int? idUser;
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
          child: Text("Erro ao atualizar.",
              style: TextStyle(fontSize: 20, color: Colors.white))),
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
  );

  @override
  void dispose() {
    Loader.hide();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Loader.show(context, progressIndicator: LinearProgressIndicator());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
            "Perfil do usário",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Column(
        children: [
          FutureBuilder<int>(
              future: UserController.getUserId(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                Loader.isShown;
                if (snapshot.hasData) {
                  idUser = snapshot.data! ;
                }

                return idUser != null ? FutureBuilder<UserModel>(
                    future: UserController.getUser(idUser!),
                    builder: (BuildContext context,
                        AsyncSnapshot<UserModel> snapshot) {
                      if (snapshot.hasData) {
                        userModel = snapshot.data;
                        _nameController.text = snapshot.data?.name as String;
                        _emailController.text = snapshot.data?.email as String;
                        Loader.hide();
                      }
                      return Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                buildTitleFieldsProfile("Nome"),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: _nameController,
                                  decoration: buildInputDecorationFields("Digite seu nome"),
                                  style: const TextStyle(
                                      color: Color(0xff000000), fontWeight: FontWeight.w600, fontSize: 16),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'O campo não pode estar vazio.';
                                    }
                                  },
                                ),
                                 const SizedBox(height: 20),
                                 buildTitleFieldsProfile("Email"),
                                const SizedBox(height: 12),
                                TextFormField(
                                  style: const TextStyle(
                                      color: Color(0xff000000), fontWeight: FontWeight.w600, fontSize: 16),
                                  controller: _emailController,
                                  decoration: buildInputDecorationFields("Digite seu email"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
                                      return 'Email inválido, digite novamente';
                                    }
                                  },
                                ),
                                const SizedBox(height: 15),
                                buildSaveRegistterBtn(),
                              ],
                            )),
                      );
                    }) : Text("Erro");
              }),
          const SizedBox(height: 10),
          const Divider(
            height: 3,
            thickness: 1,
            endIndent: 0,
            color: Colors.black,
          ),
          const SizedBox(height: 15),
          const Align(
            alignment: Alignment.center,
            child: Text(
                "Seus eventos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: FutureBuilder<List<EventModel>>(
                future: EventController.getEventById(),
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

  Align buildTitleFieldsProfile(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xff000000), fontWeight: FontWeight.bold, fontSize: 16),
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
  InputDecoration buildInputDecorationFields(String hintText) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(width: 3, color: Color(0xffF7C548))
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 4, color: Color(0xffF7C548))
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  const BorderSide(width: 3, color: Colors.red),

      ),
      border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 4, color: Color(0xffF7C548))
      ),
      errorStyle: const TextStyle(
        fontSize: 16.00,
      ),
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 16.00, color: Colors.black54),
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
