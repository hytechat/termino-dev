import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'appbar_widget.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/user_data.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name) {
    user.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colourpalette.hellbeigeGrau,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Divider(
                color: Colors.white,
                height: 30,
              ),
              const SizedBox(
                  width: 330,
                  child: Text(
                    "Wie lautet dein Name?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for First Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bitte geben Sie Ihren Vornamen ein';
                              } else if (!isAlpha(value)) {
                                return 'Nur Buchstaben verwenden';
                              }
                              return null;
                            },
                            decoration: InputDecoration(labelText: 'Vorname'),
                            controller: firstNameController,
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for Last Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Bitte geben Sie Ihren Nachnamen ein';
                              } else if (!isAlpha(value)) {
                                return 'Nur Buchstaben verwenden';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Nachname'),
                            controller: secondNameController,
                          )))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(195, 16, 4, 1),
                            minimumSize: const Size.fromHeight(2),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate() &&
                                isAlpha(firstNameController.text +
                                    secondNameController.text)) {
                              updateUserValue(firstNameController.text +
                                  " " +
                                  secondNameController.text);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Akzeptieren',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
            ],
          ),
        ));
  }
}
