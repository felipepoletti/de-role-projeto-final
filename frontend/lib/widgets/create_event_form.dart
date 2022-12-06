import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_api_flutter_course/models/EventModel.dart';
import 'package:store_api_flutter_course/controller/event_controller.dart';
import 'dart:io';

import '../screens/home_screen.dart';

class CreateEventForm extends StatefulWidget {
  final EventModel? eventModel;
  final bool editEvent;
  const CreateEventForm({super.key,required this.editEvent, this.eventModel});

  @override
  CreateEventFormState createState() {
    return CreateEventFormState();
  }
}

class CreateEventFormState extends State<CreateEventForm> {
  @override
  void initState() {
    timeinput.text = "";
    super.initState();
  }

  XFile? image;

  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController timeinput = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();

  String _dropdownValue = "Escolha";
  List<String> dropDownOptions = [
    'Escolha',
    'Musicais',
    'Museus',
    'Feiras',
    'Teatro',
    'Religião',
    'Festivais',
    'Dança'
  ];
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  final snackbarError = const SnackBar(
    content: SizedBox(
      height: 80,
      child: Align(
          alignment: Alignment.center,
          child: Text("Email e/ou senhas inválidos.",
              style: TextStyle(fontSize: 20, color: Colors.white))),
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
  );
  final snackbarSucessCreated =  const SnackBar(
    content: SizedBox(
      height: 80,
      child: Align(
          alignment: Alignment.center,
          child: Text(
              "Evento cadastrado com sucesso.",
              style: TextStyle(fontSize: 20, color: Colors.white))),
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 1),
  );
  final snackbarSucessUpdated =  const SnackBar(
    content: SizedBox(
      height: 80,
      child: Align(
          alignment: Alignment.center,
          child: Text(
              "Evento atualizado com sucesso.",
              style: TextStyle(fontSize: 20, color: Colors.white))),
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 1),
  );
  @override
  Widget build(BuildContext context) {
    return widget.editEvent ?
      FutureBuilder<EventModel>(
          future: EventController.getEventDescription(widget.eventModel?.id!),
          builder: (BuildContext context, AsyncSnapshot<EventModel> snapshot) {
            var response;
            if(snapshot.hasData) {
              response = snapshot.data;

              _titleController.text = response.eventName;
              _valueController.text = response.price.toString();
              _descriptionController.text = response.eventDescription;
             _eventDateController.text = response.date;
             timeinput.text = response.time;
             enderecoController.text = response.address;
             numeroController.text = response.addressNumber;
             complementoController.text = response.addressComplement;
             _dropdownValue = response.eventType;
             bairroController.text = response.addressDistrict;
            }
            return buildFormCreateEvent();

          }
      )
        : buildFormCreateEvent() ;
  }

  Form buildFormCreateEvent() {
    return Form(
    key: _formKey,
    child: Column(
      children: [
        buildLabelCreateEvent("Escolha a imagem"),
        const SizedBox(height: 20),
        buildImageSelectionField(),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: buildLabelCreateEvent("Título"),
              ),
              const SizedBox(height: 12),
              buildTitleField(),
              const SizedBox(height: 20),
              buildRowLabels("Categorias", "Valor"),
              const SizedBox(height: 12),
              buildRowCategoriesValueFields(),
              const SizedBox(height: 20),
              buildRowLabels("Data", "Horário"),
              const SizedBox(height: 12),
              buildRowTimePickers(),
              const SizedBox(height: 20),
              buildRowLabels("Bairro", "Endereço"),
              const SizedBox(height: 12),
              buildRowDistrictAdress(),
              const SizedBox(height: 20),
              buildRowLabels("Número", "Complemento"),
              const SizedBox(height: 12),
              buildRowNumberComplement(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: buildLabelCreateEvent("Decrição"),
              ),
              const SizedBox(height: 12),
              buildFieldDescription()
            ],
          ),
        ),
        const SizedBox(height: 40),
        buildSaveRegistterBtn()
      ],
    ),
  );
  }

  Row buildRowNumberComplement() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextFormField(
            controller: numeroController,
            decoration: buildInputDecorationFields("Numero"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: TextFormField(
            controller: complementoController,
            decoration: buildInputDecorationFields("Complemento"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo não pode estar vazio.';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Row buildRowDistrictAdress() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextFormField(
            controller: bairroController,
            decoration: buildInputDecorationFields("Informe o bairro"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo não pode estar vazio.';
              }
              return null;
            },
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: TextFormField(
            controller: enderecoController,
            decoration: buildInputDecorationFields("Endereço"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo não pode estar vazio.';
              }
              return null;
            },
          ),
        )
      ],
    );
  }

  Stack buildImageSelectionField() {
    return Stack(
      children: [
        image != null
            ? Image.file(File(image!.path),
                fit: BoxFit.cover, width: double.infinity, height: 200)
            : Image.asset("assets/images/placeholder-img.jpg",
                fit: BoxFit.cover, width: double.infinity, height: 200),
        Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                myAlert();
              },
              child: const Icon(
                Icons.camera_alt,
                color: Color(0xffF7C548),
                size: 40,
              ),
            ))
      ],
    );
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  TextFormField buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: buildInputDecorationFields("Insira o título do seu evento"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O campo não pode estar vazio.';
        }
        return null;
      },
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Escolha de onde voce ira selecionar a foto'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('Galeria'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  SizedBox buildFieldDescription() {
    return SizedBox(
      child: TextFormField(
        controller: _descriptionController,
        decoration: buildInputDecorationFields("Descreva o evento"),
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        minLines: 4,
        maxLines: null,
      ),
    );
  }

  Align buildFieldBairro() {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 160,
        child: TextFormField(
          controller: bairroController,
          decoration: buildInputDecorationFields("Informe o bairro"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'O campo não pode estar vazio.';
            }
            return null;
          },
        ),
      ),
    );
  }

  Row buildRowTimePickers() {
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: TextFormField(
              controller: _eventDateController,
              decoration: buildInputDecorationFields("Selecione a data"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  helpText: "",
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  firstDate: DateTime(1800),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  setState(() {
                    _eventDateController.text = formattedDate;
                  });
                }
              },
            )),
        const Spacer(),
        Expanded(
            flex: 4,
            child: TextFormField(
              readOnly: true,
              controller: timeinput,
              decoration: buildInputDecorationFields("Horário"),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  String hourFomrated = pickedTime.hour < 10
                      ? "0${pickedTime.hour}"
                      : pickedTime.hour.toString();
                  String minuteFormated = pickedTime.minute < 10
                      ? "0${pickedTime.minute}"
                      : pickedTime.minute.toString();

                  setState(() {
                    timeinput.text = "${hourFomrated}:${minuteFormated}";
                  });
                }
              },
            )),
      ],
    );
  }

  Row buildRowCategoriesValueFields() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xffF7C548), width: 3),
                  ),
                  items: dropDownOptions
                      .map<DropdownMenuItem<String>>((String mascot) {
                    return DropdownMenuItem<String>(
                        value: mascot, child: Text(mascot));
                  }).toList(),
                  value: _dropdownValue,
                  onChanged: dropdownCallback)),
        ),
        const Spacer(),
        Expanded(
            flex: 4,
            child: TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: buildInputDecorationFields("Valor do evento")))
      ],
    );
  }

  Row buildRowLabels(String label1, String label2) {
    return Row(
      children: [
        Expanded(flex: 4, child: buildLabelCreateEvent(label1)),
        const Spacer(),
        Expanded(
          flex: 4,
          child: buildLabelCreateEvent(label2),
        )
      ],
    );
  }

  Text buildLabelCreateEvent(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Color(0xff000000), fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  SizedBox buildSaveRegistterBtn() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          validateForm();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF7C548),
        ),
        child:  Align(
          alignment: Alignment.center,
          child: Text(
            widget.editEvent ? "ATUALIZAR": "SALVAR",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecorationFields(String hintText) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 3, color: Color(0xffF7C548))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 4, color: Color(0xffF7C548))),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 3, color: Colors.red),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 4, color: Color(0xffF7C548))),
      errorStyle: const TextStyle(
        fontSize: 16.00,
      ),
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 16.00, color: Colors.black54),
    );
  }

  Future<void> validateForm() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      EventModel eventModelObject = EventModel(
          id: widget.editEvent? widget.eventModel?.id : 0,
          eventName: _titleController.text,
          price: double.parse(_valueController.text),
          eventDescription: _descriptionController.text,
          date: _eventDateController.text,
          time: timeinput.text,
          address: enderecoController.text,
          addressNumber: numeroController.text,
          addressComplement: complementoController.text,
          eventType: _dropdownValue.toString(),
          userId: widget.editEvent? widget.eventModel?.userId : prefs.getInt("user_id"),
          addressDistrict: bairroController.text);
      Loader.isShown;

      var response = widget.editEvent ? await EventController.updateEvent(eventModelObject) : await EventController.createEvent(eventModelObject);
      if (response == true) {

        ScaffoldMessenger.of(context).showSnackBar(widget.editEvent ? snackbarSucessUpdated : snackbarSucessCreated);
        await Future.delayed(const Duration(seconds: 1));
        Loader.hide();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Loader.hide();
        ScaffoldMessenger.of(context).showSnackBar(snackbarError);
      }
    }
  }
}
