import 'package:flutter/cupertino.dart';

import '../config_expo.dart';

class BasicVorleseButton extends StatelessWidget {
  const BasicVorleseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return basicIconButton(
      IconsGoogle.vorleseIcon,

      () {
        testAlert(context);
      },
      Colourpalette.bundesrot
    );
  }

    testAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoDialogAction(
            child: Text('ok'),
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop("Discard");
            },
          );
        });
  }
}
