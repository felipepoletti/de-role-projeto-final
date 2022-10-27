import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'register_screen.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              const SizedBox(height: 20),
              buildFlexibleLogoHeader(size),
              const SizedBox(height: 40),
              const LoginForm(),
              buildForgetPassword(),
              buildCreateAccount(context),
            ],
            ),
          ),
        )
    );



  }

  Padding buildCreateAccount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Flexible(
                flex: 3,
                child: Text(
                  "não possui uma conta?",
                  style: TextStyle(
                    color: Color(0xff6D6D6D),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            Flexible(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const RegisterScreen())
                      );
                    },
                    child: const Text(
                        "cadastre-se",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: Color(0xffF7C548),
                          fontSize: 18,
                          color: Color(0xffF7C548),
                        )
                    ),
                  )
              ),
            ),
          ]
      ),
    );
  }

  Flexible buildFlexibleLogoHeader(Size size) {
    return Flexible(
      child: Container(
          height: size.height * 0.3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo-reduzido.png"), fit: BoxFit.contain )
          )
      ),
    );
  }

  Padding buildForgetPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: RichText(
          text: const TextSpan(
              text: "esqueci minha senha",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Color(0xffF7C548),
                decorationThickness: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffF7C548),
              )
          )
      ),
    );
  }
}
