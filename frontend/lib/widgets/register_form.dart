import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {

    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            buildContainerLabelInput("Nome completo", "Digite seu nome completo",1),
            buildContainerLabelInput("Email", "Digite seu email",2),
            buildContainerLabelInput("Senha", "Digite sua senha",3),


          ],
        ),
      );
    }

    SizedBox buildContainerLabelInput(String labelName,String hintText, int tipoValidacao) {
      // Tipo 1 para campos normais
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
                  obscureText: tipoValidacao == 3 ? true : false,
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

                    decoration: InputDecoration(
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
                    )
                )
              ],
            ),
          );
    }




  // void validateForm() {
  //   if (_formKey.currentState!.validate()) {
  //     if( loginEmailController.text == "dev@seguros.com" && loginPasswordController.text == "dev123") {
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => const HomeScreen())
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(snackbarError);
  //     }
  //   }
  // }

}

