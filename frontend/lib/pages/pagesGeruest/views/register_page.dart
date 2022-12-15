import 'package:flutter/material.dart';
import 'package:termino_frontend/config/config_expo.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  //Booleans um Passwort aufzudecken
  bool _obscureText = true;
  bool _obscureText2 = true;

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

  void datenschutzMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: const [
              Text(
                'Fehler!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Sie müssen der Datenschutzerklärung zustimmen!',
                style: TextStyle(fontSize: 14, color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

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
                    labelText: 'Benutzername',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld darf nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9]').hasMatch(value)) {
                      return "Dieser Name entspricht nicht den Richtlinien!"; //To be defined was die Guidelines sind - generell was hier alles zulässig sein darf
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
                      return "Das Feld darf nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Diese E-Mail Adresse ist ungültig!";
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
                  obscureText: _obscureText,
                  controller: PasswController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Passwort',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld darf nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)')
                            .hasMatch(value!)) {
                      return "Notwendig sind: Groß-, Kleinbuchstabe, Zahl und Sonderzeichen!";
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
                  obscureText: _obscureText2,
                  controller: PassWdhController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                      child: Icon(_obscureText2
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Passwort wiederholen',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld darf nicht leer sein!";
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
                  setState(() {
                    _checkBoxListTile = val;
                  });
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
                    if (formKey.currentState!.validate() &&
                        _checkBoxListTile == true) {
                      Navigator.pushReplacementNamed(context, '/navigation');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Registration successful!')),
                      );
                    } else if (formKey.currentState!.validate() &&
                        _checkBoxListTile == false) {
                      datenschutzMessage();
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
