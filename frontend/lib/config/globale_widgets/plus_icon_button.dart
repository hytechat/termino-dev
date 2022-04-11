
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/config_expo.dart';

import '../colours.dart';
import '../standard_widget_settings.dart';

class plusIconButton extends StatefulWidget {
  Icon icon;
  Function onPressed;


  plusIconButton(
    {required this.icon,
    required this.onPressed}
    
  );

  @override
  State<plusIconButton> createState() => _plusIconButtonState();
}

class _plusIconButtonState extends State<plusIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment:  Alignment.center,
      padding: ContainerBaseSettings.padding, //sollte den halben absteand der conatiner voneinander beschreiben bzw den ganzen abstand von rand oder nächsten widget ohne padding
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colourpalette.hellbeigeGrau,
              boxShadow: [
                BoxShadow(
                  color: Colourpalette.dunkelbeigeGrau,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(1, 3),
                ),
              ],
            ),
      child: IconButton(
        onPressed:() => widget.onPressed, 
        icon: widget.icon,
        color: Colourpalette.bundesrot,
        alignment: Alignment.center,
        //padding: EdgeInsets.all(0), //sollte den halben absteand der conatiner voneinander beschreiben bzw den ganzen abstand von rand oder nächsten widget ohne padding
        enableFeedback: true,
        highlightColor: Colourpalette.tryhellrosa,
        iconSize:24, 
      ),
    ),
    );
  }

 
}
