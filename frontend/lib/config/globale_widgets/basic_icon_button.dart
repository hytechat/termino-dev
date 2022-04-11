import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/config_expo.dart';

class basicIconButton extends StatefulWidget {
  Color iconColour ;
  Icon icon;

  Function onPressed;
//hier muss ich umbaune von kind auf function und das überall ausbessern

  basicIconButton(this.icon, this.onPressed,this.iconColour);

  @override
  State<basicIconButton> createState() => _basicIconButtonState();
}

class _basicIconButtonState extends State<basicIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        
        onPressed: () {
          // testAlert(context);
          widget.onPressed();

        }, //bin mir nicht sicher ob wir das auch als parameter in die ethod übergeben sollten und wenn ja wie
        icon: widget.icon,
        color: widget.iconColour,
        enableFeedback: true,
        highlightColor: Colourpalette.tryhellrosa,
        iconSize:
            24, //<- basic sollte 24 sein ? muss man sich spielen wie man es haben wioll ob es überall gleich is oder malk so mal so
        alignment: Alignment
            .center, // <-- ist eig der basic wert wenn ned angegeben https://api.flutter.dev/flutter/painting/Alignment/center-constant.html
        //splashColor: ,  <--hehehehe fun
        //splashRadius: ,
        //tooltip: , nützlich ? wennn wir das haben wollen muss es übergebbar sien ....
      ),
    );
  }

  // void testAlert(BuildContext context) {
  //   showCupertinoDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return widget.kind;
  //       });
  // }
}
