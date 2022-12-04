import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:termino_frontend/classes/User.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  //2 Controller um User Input zu holen
  final UserController = TextEditingController();
  final PasswController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    UserController.dispose();
    PasswController.dispose();
    super.dispose();
  }

  void loginFehler() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Der User oder das Passwort sind nicht korrekt!'),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4, milliseconds: 3, microseconds: 1),
        action: SnackBarAction(
          label: 'Verstanden',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        )));
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
              SizedBox(height: height * 0.25),
              const Text(
                "Login",
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
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Name ist nich korrekt!";
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
                  obscureText: true,
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
                    }
                    /*else if (value!.isEmpty ||
                        !RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)')
                            .hasMatch(value!)) {
                      return "Notwendig sind: Großbuchstabe, Zahl und Sonderzeichen!";
                    } */
                    else {
                      return null;
                    }
                  },
                ),
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
                      //padding: const EdgeInsets.symmetric(
                      //  horizontal: 40.0, vertical: 20.0),
                      backgroundColor: const Color.fromRGBO(195, 16, 4, 1),
                      minimumSize: const Size.fromHeight(2),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          userCheck(
                                  UserController.text, PasswController.text) ==
                              true) {
                        Navigator.pushReplacementNamed(context, '/navigation');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Erfolgreicher Login!'), backgroundColor: Colors.green,),
                        );
                      } else if (formKey.currentState!.validate() &&
                          userCheck(
                                  UserController.text, PasswController.text) ==
                              false) {
                        loginFehler();
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(46, 88, 235, 1),
                ),
                child: const Text(
                  'Passwort vergessen?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 50,
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(46, 88, 235, 1),
                ),
                child: const Text(
                  'REGISTRIEREN',
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
              ),
              Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //padding: const EdgeInsets.symmetric(
                      //  horizontal: 40.0, vertical: 20.0),
                      backgroundColor: const Color.fromRGBO(217, 211, 199, 1),
                      minimumSize: const Size.fromHeight(2),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ALS GAST FORTFAHREN',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

bool? userCheck(String name, String pw) {
  bool check = false;
  if (name == 'Admin' && pw == 'Termin0!') {
    check = true;
    return check;
  } else if (name != 'Admin' || pw != 'Termin0!') {
    check = false;
    return check;
  } else {
    return null;
  }
}
