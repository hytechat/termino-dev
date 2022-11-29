import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  //Controller um User Input zu holen
  final UserController = TextEditingController();
  final MailController = TextEditingController();
  final PasswController = TextEditingController();
  final PassWdhController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    UserController.dispose();
    MailController.dispose();
    PasswController.dispose();
    PassWdhController.dispose();
    super.dispose();
  }

  //Platzhalter, damit Controller angesteuert werden können
  String mail = '';
  String passwort = '';
  String pwWdh = '';
  String username = '';

  bool? _checkBoxListTile = false; //? macht Bool nullable

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              const Text(
                "Registrierung",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: UserController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld kann nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9]').hasMatch(value)) {
                      return "Dieser Name entspricht nicht unseren Guidelines!"; //To be defined was die Guidelines sind - generell was hier alles zulässig sein darf
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: MailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'E-Mail Adresse',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld kann nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                      return "Diese Mail ist ungültig!";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: PasswController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Passwort',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld kann nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)')
                            .hasMatch(value!)) {
                      return "Notwendig sind: Großbuchstabe, Zahl und Sonderzeichen!";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: PassWdhController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Passwort wiederholen',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld kann nicht leer sein!";
                    } else if (PassWdhController.text != PasswController.text) {
                      return "Die Passwörter stimme nicht überein!";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 25,
              ),
              CheckboxListTile(
                value: _checkBoxListTile,
                title: const Text(
                    "Ich habe die Datenschutzerklärung gelesen und bin einverstanden, dass die Daten zum Zwecke der Terminabstimmung gespeichert werden."),
                onChanged: (val) {
                  setState() {
                    _checkBoxListTile = val;
                  }
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: const EdgeInsets.symmetric(
                    //  horizontal: 40.0, vertical: 20.0),
                    backgroundColor: const Color.fromRGBO(195, 16, 4, 1),
                    minimumSize: const Size.fromHeight(2),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/navigation');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Registration successful!')),
                      );
                    }
                  },
                  child: const Text(
                    "Registrieren",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (_) => false);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromRGBO(46, 88, 235, 1),
                ),
                child: const Text(
                  'Zurück',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
