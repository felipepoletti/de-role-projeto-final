import 'dart:async';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/UserModel.dart';
import 'package:store_api_flutter_course/screens/login_screen.dart';
import '../controller/user_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});



  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }

}

const snackbarSucess =  SnackBar(
  content:  SizedBox(
    height: 80,
    child:  Align(
        alignment: Alignment.center,
        child: Text(
            "Usuario cadastrado com sucesso.",
            style: TextStyle(fontSize: 20, color: Colors.white))
    ),
  ),
  backgroundColor: Colors.green,
  duration: Duration(seconds: 1),
);
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
      duration: Duration(seconds: 1),
    );
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

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


    Future<void> validateForm() async {
      if (_formKey.currentState!.validate()) {
        var response =  await UserController.registerUser(UserModel(id: 0, name: _nameController.text, email: _emailController.text, password: _passwordController.text));
        if(response == true) {
          ScaffoldMessenger.of(context).showSnackBar(snackbarSucess);
          await Future.delayed(const Duration(seconds: 1));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen())
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

                  obscureText:tipoValidacao == 3 ? true : false,
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

