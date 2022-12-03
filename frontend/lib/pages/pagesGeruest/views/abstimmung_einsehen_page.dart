import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/appbar_widget.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/user_data.dart';

class AbstimmungEinsehenPage extends StatefulWidget {
// const AbstimmungEinsehenPage({Key? key}) : super(key: key);
  final String organizer;
  final String titel;
  final String place;

  const AbstimmungEinsehenPage({super.key, required this.organizer, required this.titel, required this.place});

  @override
  _AbstimmungEinsehenPage createState() => _AbstimmungEinsehenPage(organizer, titel, place);
}

class _AbstimmungEinsehenPage extends State<AbstimmungEinsehenPage> {
  final String organizer2;
  final String titel2;
  final String place2;

  var user = UserData.myUser;

  _AbstimmungEinsehenPage(this.organizer2, this.titel2, this.place2);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 300,
              child: Text(
                "Abstimmung einsehen",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                      decoration:
                          const InputDecoration(labelText: 'Titel des Termins'),
                      initialValue: titel2,
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
                      initialValue: place2,
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
                      decoration:
                          const InputDecoration(labelText: 'Organisator'),
                      initialValue: organizer2,
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
                        decoration: const BoxDecoration(color: Colors.grey)),
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
