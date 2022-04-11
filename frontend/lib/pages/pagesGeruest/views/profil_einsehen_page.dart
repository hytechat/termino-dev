import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/colours.dart';
import 'package:termino_frontend/config/icons.dart';

class ProfilEinsehenPage extends StatefulWidget {
  @override
  _ProfilEinsehenPageState createState() => _ProfilEinsehenPageState();
}

class _ProfilEinsehenPageState extends State<ProfilEinsehenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colourpalette.backgroundhellbeigeGrau,
      child: const Center(

        child: IconsGoogle.personIcon,
      ),
    );
  }
}
