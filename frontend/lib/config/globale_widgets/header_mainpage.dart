import 'package:flutter/material.dart';
import 'package:termino_frontend/config/colours.dart';
import 'package:termino_frontend/config/config_expo.dart';

class Seitentitel extends StatefulWidget {
  var seitentitelinput;

  Seitentitel(this.seitentitelinput);

  @override
  _SeitentitelState createState() => _SeitentitelState();
}

class _SeitentitelState extends State<Seitentitel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children:[
        SizedBox(height: 10),
        Text(widget.seitentitelinput,style: Textstyle.seitentitel),
        SizedBox(height: 5),
        Divider(color: Colourpalette.terminGrauHell, thickness: 1,),
        SizedBox(height: 15 ),
      ])
       
      
    );
  }
}