import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'; <-- Import zur community erweiterung der google icons sollten zum desig guide der google icons passen

class IconsGoogle {
  //die standard implementierten Icons in flutter material app sind was ich bisher sehen kann ident mit den Icons: https://fonts.google.com/icons?selected=Material+Icons:extension
  // könnten um das community pack erweitert werden wenn einem gewisse symbole nicht passen --> dafür nächste zeil einkommentieren und import aktivieren:
//static const  Icon testeroo = Icon(MdiIcons.testTube);

  static const Icon homeIcon = Icon(Icons.home_rounded);
  static const Icon vorleseIcon = Icon(Icons.hearing_rounded);
  static const Icon searchIcon = Icon(Icons.search_rounded);
  static const Icon plusIcon = Icon(Icons.add_rounded);
  static const Icon personIcon = Icon(Icons.person_rounded);
  static const Icon terminIcon = Icon(Icons.date_range_rounded);
  static const Icon personEinstellungen = Icon(Icons.manage_accounts_rounded);
  static const Icon frageIcon = Icon(Icons.help_outline_rounded);
  static const Icon loesch = Icon(Icons.delete);
  static const Icon change = Icon(Icons.edit);
  static const Icon accept = Icon(Icons.check);
  static const Icon decline = Icon(Icons.close);
   static const Icon maybe = Icon(Icons.help);
   static const Icon teilnehmer = Icon(Icons.person);

  // gerne ausbessern :D
}

class IconsCupertino {
  //lege ich amal an, das waren die die als iOS vorgeschlagen wurden --> kann man ja dann rauslöschen wenn die entscheidung final gefallen ist bzw müssen wir in the long run vl 2 verschieden styles verwenden jenachdem welches OS
  static const Icon homeIcon = Icon(CupertinoIcons.home);
  static const Icon vorleseIcon = Icon(CupertinoIcons.speaker_2);
  static const Icon searchIcon = Icon(CupertinoIcons.search);
  static const Icon plusIcon = Icon(CupertinoIcons.add);
  static const Icon personIcon = Icon(CupertinoIcons.person);
  static const Icon terminIcon = Icon(CupertinoIcons.calendar);
}
