import 'dart:async';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/colours.dart';
import 'package:termino_frontend/config/icons.dart';

import '../profile_details/display_image_widget.dart';
import '../profile_details/edit_image.dart';
import '../profile_details/edit_name.dart';
import '../profile_details/user_data.dart';
import 'home_page.dart';

class ProfilEinsehenPage extends StatefulWidget {
  @override
  _ProfilEinsehenPageState createState() => _ProfilEinsehenPageState();
}

class _ProfilEinsehenPageState extends State<ProfilEinsehenPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 70),
          )),
          InkWell(
              onTap: () {
                navigateSecondPage(EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
              )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 50),
          )),
          buildUserInfoDisplay(user.name, 'Name', EditNameFormPage()),
          buildEMailField(user.email, 'E-Mail Adresse'),
          Container(
              height: 90,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(195, 16, 4, 1),
                  minimumSize: const Size.fromHeight(0),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  //color: Color.fromRGBO(195, 16, 4, 1),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    //color: Color.fromRGBO(195, 16, 4, 1),
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4,
                              color: Colors.black),
                            ))),
                    Icon(
                      Icons.keyboard_arrow_right,
                      //color: Color.fromRGBO(195, 16, 4, 1),
                      size: 40.0,
                    )
                  ]))
            ],
          ));


 Widget buildEMailField(String getValue, String title) =>
      Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  //color: Color.fromRGBO(195, 16, 4, 1),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    //color: Color.fromRGBO(195, 16, 4, 1),
                    width: 1,
                  ))),
                            child: Text(
                              getValue,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, height: 1.4,
                              color: Colors.black),
                            ),
                  )
            ],
          ));



  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
