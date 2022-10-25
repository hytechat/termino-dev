import 'package:flutter/material.dart';
import 'package:termino_frontend/app.dart';
import 'package:termino_frontend/config/config_expo.dart';

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
        debugShowCheckedModeBanner: false,
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
                      'Login',
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
                  controller: MailController,
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
                      primary: const Color.fromRGBO(195, 16, 4, 1),
                      minimumSize: const Size.fromHeight(2),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
                        
                      
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromRGBO(46, 88, 235, 1),
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
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromRGBO(46, 88, 235, 1),
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
                      primary: const Color.fromRGBO(217, 211, 199, 1),
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
        )));
  }
}

void _navigateIntoApp(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => appBasic()));
}
