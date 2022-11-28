import 'dart:async';
import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';
import 'package:store_api_flutter_course/screens/login_screen.dart';

import '../controller/user_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});



  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }

}

class RegisterFormState extends State<RegisterForm> {
    final userRegister = UserController();
    final snackbarError =  const SnackBar(
      content:  SizedBox(
        height: 80,
        child:  Align(
            alignment: Alignment.center,
            child: Text(
                "Email e/ou senhas inválidos.",
                style: TextStyle(fontSize: 20, color: Colors.white))
        ),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    );
    final snackbarSucess =  const SnackBar(
      content:  SizedBox(
        height: 80,
        child:  Align(
            alignment: Alignment.center,
            child: Text(
                "Evento cadastrado com sucesso.",
                style: TextStyle(fontSize: 20, color: Colors.white))
        ),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    );final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordConfirmController = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            buildPaddingInputFields(buildContainerLabelInput("Nome completo", "Digite seu nome completo",1, _nameController)),
            const SizedBox(height: 20),
            buildPaddingInputFields(buildContainerLabelInput("Email", "Digite seu email",2, _emailController)),
            const SizedBox(height: 20),
            buildPaddingInputFields(buildContainerLabelInput("Senha", "Digite sua senha",3, _passwordController)),

            const SizedBox(height: 40),
            buildSaveRegistterBtn()
          ],
        ),
      );
    }

    SizedBox buildSaveRegistterBtn() {
      return SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {validateForm();},
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color(0xffF7C548),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text("SALVAR",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
    }

    Padding buildPaddingInputFields(SizedBox child) {
      return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: child,
          );
    }

    SizedBox buildPasswordConfirmInput() {
      return SizedBox(
            child: Column(
              children:  [
                const SizedBox(
                  width: double.infinity,
                  child:  Text(
                    "Confirme sua senha",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                    obscureText: false,
                    controller: _passwordConfirmController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O campo não pode estar vazio.';
                      }
                      if(_passwordController != _passwordConfirmController) {
                        return 'Senha não é igual a inserida acima';
                      }
                      return null;
                    },
                    decoration: buildInputDecorationFields("Confirme sua senha")
                )
              ],
            ),
          );
    }
    Future<void> validateForm() async {
      if (_formKey.currentState!.validate()) {
        var response =  await userRegister.registerUser(_nameController.text, _emailController.text, _passwordController.text);
        if(response == true) {
          ScaffoldMessenger.of(context).showSnackBar(snackbarSucess);
          Timer(const Duration(seconds: 3), () =>
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen())
              )
          );

        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(snackbarError);
        }

      }
    }

    SizedBox buildContainerLabelInput(String labelName,String hintText, int tipoValidacao, TextEditingController controller) {
      // Tipo 1 para campos genericos
      // Tipo 2 para email
      // Tipo 3 para senha
      return SizedBox(
            child: Column(
              children:  [
                 SizedBox(
                  width: double.infinity,
                  child:  Text(
                    labelName,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller,

                  obscureText:false,
                  validator: (value) {
                    if(tipoValidacao == 1 || tipoValidacao == 3) {
                      if (value == null || value.isEmpty) {
                        return 'O campo não pode estar vazio.';
                      }
                    } else if(tipoValidacao == 2) {
                      if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
                        return 'Email inválido, digite novamente';
                      }
                    }
                    return null;
                    },
                    decoration: buildInputDecorationFields(hintText)
                )
              ],
            ),
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






}

