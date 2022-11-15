import 'package:flutter/material.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/views.dart';

class appBasic extends StatefulWidget {
  @override
  _appBasicState createState() => _appBasicState();
}

class _appBasicState extends State<appBasic> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Termino',
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/geruest': (context) => PagesGeruest(),
      }
      
    );
  }
}
