import 'package:flutter/material.dart';
import 'package:termino_frontend/app.dart';
import 'package:termino_frontend/config/config_expo.dart';

import '../pagesgerues.dart';
import 'home_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final MailController = TextEditingController();
  final PasswController = TextEditingController();

  String mail = '';
  String passwort = '';
  String username = '';

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Registration',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Divider(
                color: Colors.white,
                height: 100,
              ),
              Container(
                child: Column(
                  children: const [
                    Text(
                      'Registrieren',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: MailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'E-Mail',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: PasswController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Password wiederholen',
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 15,
              ),
              CheckboxListTile(
                title: const Text(
                    "Ich habe die Datenschutzerklärung gelesen und bin einverstanden, dass die Daten zum Zwecke der Terminabstimmung gespeichert werden."),
                value: isChecked,
                onChanged: (newValue) {
                  isChecked = true;
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const Divider(
                color: Colors.white,
                height: 25,
              ),
              Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(195, 16, 4, 1),
                      minimumSize: const Size.fromHeight(2),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: const Text(
                      "Registrieren",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
              TextButton(
                onPressed: () {},
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
        )));
  }
}

void _navigateIntoApp(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => appBasic()));
}
