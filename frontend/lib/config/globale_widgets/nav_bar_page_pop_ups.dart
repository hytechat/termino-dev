import 'package:flutter/cupertino.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:termino_frontend/config/globale_widgets/basic_vorlese_button.dart';

class BasicNavbar extends CupertinoNavigationBar { // mhm muss noch angeschaut werden.......

  final String titel;

  BasicNavbar(this.titel);

  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(this.titel),
      leading: CupertinoNavigationBarBackButton(
        onPressed: () {},
        //color: ,
      ),
      trailing: BasicVorleseButton(),
      backgroundColor: Colourpalette.bundesrot, //mhm iwo hab ich nen fehler ......

  	
    );
  }
}
