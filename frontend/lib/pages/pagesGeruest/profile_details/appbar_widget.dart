import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false, //killt BackButton
    backgroundColor: const Color.fromRGBO(217, 215, 209, 1),
    elevation: 0,
    title: Image.asset('assets/terminoLogo.png', height: 70.0, width: 200.0),
    centerTitle: true,
    leading: IconButton(
      //leading icons stehen links
      onPressed: () {},
      icon: const Icon(Icons.hearing, color: Colors.red),
    ),
    actions: [
      //action icons stehen rechts
      IconButton(
        icon: const Icon(
          Icons.search,
          color: Colors.red,
        ),
        onPressed: () {
          // do something
        },
      )
    ],
  );
}
