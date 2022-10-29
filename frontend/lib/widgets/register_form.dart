import 'dart:ffi';
import 'package:intl/intl.dart';
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

    final formKey = GlobalKey<FormState>();
    final TextEditingController _birthDayCotroller = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordConfirmController = TextEditingController();

    @override
    void initState() {
      _birthDayCotroller.text = "";
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            buildPaddingInputFields(buildContainerLabelInput("Nome completo", "Digite seu nome completo",1, _nameController)),
            const SizedBox(height: 20),
            buildPaddingInputFields(buildContainerLabelInput("Email", "Digite seu email",2, _emailController)),
            const SizedBox(height: 20),
            buildPaddingInputFields( buildContainerBirthDay(context)),
            const SizedBox(height: 20),
            buildPaddingInputFields(buildContainerLabelInput("Senha", "Digite sua senha",3, _passwordController)),
            const SizedBox(height: 20),
            buildPaddingInputFields(buildPasswordConfirmInput()),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
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
            )
          ],
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

      SizedBox buildContainerBirthDay(BuildContext context) {
      return SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child:  Text(
                    "Data de nascimento",
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
                  controller: _birthDayCotroller, //editing controller of this TextField
                  decoration: buildInputDecorationFields("Selecione sua data de nascimento"),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        helpText: "",
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        firstDate: DateTime(1800),
                        lastDate: DateTime(2101),

                    );
                    if(pickedDate != null ){
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                      setState( () {
                        _birthDayCotroller.text = formattedDate;
                      });
                    }
                  },
                )
              ],
            ),
          );
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

    GlobalKey<FormState> getFormKey() {
      return formKey;
    }




}

