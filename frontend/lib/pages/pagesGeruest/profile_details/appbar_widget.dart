import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(
        color: Color.fromRGBO(195, 16, 4, 1)), // set backbutton color here which will reflect in all screens.
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
