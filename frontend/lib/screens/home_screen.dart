import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';



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
              padding: const EdgeInsets.all(22.0),
              child:Column(children: [
                const SizedBox(
                  height: 60,
                ),
                Flexible(
                  child: Container(
                      height: size.height * 0.3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo-reduzido.png"), fit: BoxFit.contain )
                      )
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  child:  const Text(
                    "E-MAIL",
                    style: TextStyle(
                        color: Color(0xffF7C548),
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 80,
                  child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:  const BorderSide(width: 4, color: Color(0xffF7C548))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(width: 5, color: Color(0xffF7C548))
                        ),
                        hintText: "Digite seu email",
                        hintStyle: const TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold,color: Color(0xffF7C548)),
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: double.infinity,
                  child:  Text(
                    "SENHA",
                    style: TextStyle(
                        color: Color(0xffF7C548),
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    textAlign: TextAlign.left,
                    ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 80,
                  child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:  const BorderSide(width: 4, color: Color(0xffF7C548))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(width: 5, color: Color(0xffF7C548))
                        ),
                        hintText: "Digite sua senha",
                        hintStyle: const TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold,color: Color(0xffF7C548)),
                      )
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:  ElevatedButton(
                      onPressed: () { },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF7C548),
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
                Padding(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Flexible(
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
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
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
                          ),
                        ),
                      ]
                  ),
                ),
              ],
              ),
          ),
    )
    );



  }
}
