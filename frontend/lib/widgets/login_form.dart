import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

// Define a custom Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _loginController = LoginController();
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child:  const Text(
              "E-MAIL",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: loginEmailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
                hintText: "Digite seu email",
                hintStyle: const TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold,color: Color(0xffF7C548)),
              )
          ),
          const SizedBox(
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
          ),
          TextFormField(
            obscureText: true,
            controller: loginPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
                hintText: "Digite sua senha",
                hintStyle: const TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold,color: Color(0xffF7C548)),
              )

          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
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
            ) ,
          ),
        ],
      ),
    );
  }
  void validateForm() {
    if (_formKey.currentState!.validate()) {

    }
  }

}

final TextEditingController loginEmailController = TextEditingController();
final TextEditingController loginPasswordController = TextEditingController();