import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:termino_frontend/config/colours.dart';
import 'package:termino_frontend/config/config_expo.dart';

class basicButton extends StatefulWidget {
  //glaub das wir das file eigentlich nicht brauchen @patricia entscheide du pls ob wir ihn  raushauen , im formular body ist der basic button als speicher button hinterlegt
  final String buttontext;
  // final List<bool> felderKorrektBefuellt;
  // final Widget kind;
  final Function onButtonPressed;
  final bool isDiabled;

  basicButton(this.buttontext, this.isDiabled, this.onButtonPressed);
  // basicButton(this.buttontext, this.isDiabled, this.kind, this.onButtonPressed );

  @override
  State<basicButton> createState() => _basicButtonState();
}

class _basicButtonState extends State<basicButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        //https://api.flutter.dev/flutter/cupertino/CupertinoButton-class.html

        child: Text(widget.buttontext, style: Textstyle.textboxstyle,),
        onPressed: widget.isDiabled
            ? null
            : () {
                // hier fehlt dann das was actually gemct werden soll
                // testAlert(context);
                widget.onButtonPressed();
              },
        color: Colourpalette.bundesrot,
        disabledColor: Colourpalette.terminGrauHell,
        alignment: Alignment.center,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  // void testAlert(BuildContext context) {
  // showCupertinoDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return widget.kind;
  //     });

}
