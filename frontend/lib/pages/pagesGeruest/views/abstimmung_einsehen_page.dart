import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/appbar_widget.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/user_data.dart';

class AbstimmungEinsehenPage extends StatefulWidget {
  const AbstimmungEinsehenPage({Key? key}) : super(key: key);

  @override
  _AbstimmungEinsehenPage createState() => _AbstimmungEinsehenPage();
}

class _AbstimmungEinsehenPage extends State<AbstimmungEinsehenPage> {
      var user = UserData.myUser;
  
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        const SizedBox(
          width: 300,
          child: Text(
            "Abstimmung einsehen",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Titel des Termins'),
                initialValue: 'Weihnachten',
                enabled: false,
              ),
            ),
          ),
        ],
       ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Ort'),
                initialValue: 'Hauptbahnhof',
                enabled: false,
              ),
            ),
          ),
        ],
       ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Organisator'),
                initialValue: 'Markus',
                enabled: false,
              ),
            ),
          ),
        ],
       ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.98,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.grey
                  )),
            ),
          )
        ],
       )
      ],
    ));
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
