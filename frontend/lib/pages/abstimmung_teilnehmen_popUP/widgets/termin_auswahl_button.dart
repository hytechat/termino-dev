import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/config_expo.dart';

class TerminAuswahlButton extends StatefulWidget {
  bool dreierAuswahl;
  int number = 0;
  bool clickable = true;

  TerminAuswahlButton({required this.dreierAuswahl, required this.clickable, required this.number});

  @override
  _TerminAuswahlButtonState createState() => _TerminAuswahlButtonState();
}

class _TerminAuswahlButtonState extends State<TerminAuswahlButton> {
  @override
  Widget build(BuildContext context) {
    //return widget.dreierAuswahl ? _erstelleDreierToggle() : _erstelleZweierToggle();

    if (widget.dreierAuswahl) {
      return _erstelleDreierToggle();
    } else {
      return _erstelleZweierToggle();
    }
  }

  Widget _erstelleDreierToggle() {
    return RawMaterialButton(
      fillColor: widget.number == 0
          ? Colors.white
          : widget.number == 1
              ? Colors.red
              : widget.number == 2
                  ? Colors.yellow
                  : Colors.green,
      shape: const CircleBorder(),
      child: widget.number == 0
          ? const Icon(
              Icons.add_sharp,
              size: 30.0,
            )
          : widget.number == 1
              ? const Icon(
                  Icons.close,
                  size: 30.0,
                )
              : widget.number == 2
                  ? const Icon(
                      Icons.published_with_changes_outlined,
                      size: 30.0,
                    )
                  : const Icon(
                      Icons.check,
                      size: 30.0,
                    ),
      onPressed: widget.clickable
          ? () => {
                setState(() {
                  if (widget.number == 3) {
                    widget.number = 1;
                  } else {
                    widget.number++;
                  }
                  log(widget.number.toString());
                })
              }
          : () => {},
    );
  }

  Widget _erstelleZweierToggle() {
    //zu auswahl wechler switch es is is mir noch nichts besseres eingefallen, also 2 opder 3 Möglichkeiten
    return RawMaterialButton(
      fillColor: widget.number == 0
          ? Colors.white
          : widget.number == 1
              ? Colors.red
              : Colors.green,
      shape: const CircleBorder(),
      child: widget.number == 0
          ? const Icon(
              Icons.add_sharp,
              size: 30.0,
            )
          : widget.number == 1
              ? const Icon(
                  Icons.close,
                  size: 30.0,
                )
              : const Icon(
                  Icons.check,
                  size: 30.0,
                ),
      onPressed: widget.clickable
          ? () => {
                setState(() {
                  if (widget.number == 2) {
                    widget.number = 1;
                  } else {
                    widget.number++;
                  }
                  log(widget.number.toString());
                })
              }
          : () => {},
    );
  }
}
