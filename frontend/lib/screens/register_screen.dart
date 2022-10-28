import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/screens/login_screen.dart';
import 'package:store_api_flutter_course/widgets/login_form.dart';
import '../widgets/register_form.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const LoginScreen())
                      );},
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        IconlyBold.arrowLeftCircle,
                        color: Color(0xffF7C548),
                        size: 50,
                      ),
                    )
                  ),
                ),
            ),
            const SizedBox(
              height: 14,
            ),
            Flexible(
              child: Container(
                  height: size.height * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo-reduzido.png"), fit: BoxFit.contain )
                  )
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Cadastro do usuário",
                    style: TextStyle(
                      color: Color(0xff686868),
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RegisterForm(),
            ),

          ],

      ),
    );
  }
}