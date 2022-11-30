import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/screens/home_screen.dart';
import 'package:store_api_flutter_course/controller/user_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final loginApi = UserController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailLabel(),
          const SizedBox(
            height: 6,
          ),
          buildTextFormFieldEmail(),
          const SizedBox(height: 20),
          buildPasswordLabel(),
          const SizedBox(
            height: 6,
          ),
          buildTextFormFieldPassword(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: buildButtonLogin() ,

          ),

        ],
      ),
    );
  }

  SizedBox buildPasswordLabel() {
    return const SizedBox(
          width: double.infinity,
          child:  Text(
            "SENHA",
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
            textAlign: TextAlign.left,
          ),
        );
  }

  SizedBox buildEmailLabel() {
    return const SizedBox(
          width: double.infinity,
          child:  Text(
            "E-MAIL",
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
            textAlign: TextAlign.left,
          ),
        );
  }

  SizedBox buildButtonLogin() {
    return SizedBox(
            width: double.infinity,
            height: 50,
            child:  ElevatedButton(
              onPressed: () => validateForm(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF7C548),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // <-- Radius

                ),

              ),
              child: const Text(
                "ENTRAR",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
          obscureText: true,
          controller: loginPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo senha não pode estar vazio.';
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
              hintText: "Digite sua senha",
              hintStyle: const TextStyle(fontSize: 16.00, color: Colors.black54),
            )

        );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
          controller: loginEmailController,
          validator: (value) {
            if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
              return 'Email inválido, digite novamente';
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
              hintText: "Digite seu email",
              hintStyle: const TextStyle(fontSize: 16.00, color:  Colors.black54),
            )
        );
  }


  Future<void> validateForm() async {
    if (_formKey.currentState!.validate()) {
      var response =  await loginApi.login(loginEmailController.text, loginPasswordController.text);
      if(response == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen())
        );
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(snackbarError);
      }
    }
  }

}

