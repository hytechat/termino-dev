import 'package:flutter/material.dart';
import 'package:termino_frontend/app.dart';

import '../pagesgerues.dart';
import 'home_page.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  //2 Controller um User Input zu holen
  final MailController = TextEditingController();
  final PasswController = TextEditingController();

  //Key definieren für Fehlermessage

  //Variablen definieren für Demo User
  String mail = '';
  String passwort = '';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
            body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: MailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: PasswController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Login'),
                      onPressed: () => Navigator.pushNamed(context
                      , "app"),
                      )),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Passwort vergessen?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Registrieren',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Als Gast fortfahren'),
                    onPressed: () {},
                  )),
            ],
          ),
        )));
  }
}

void _navigateIntoApp(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => appBasic()));
}
