import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/colours.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:termino_frontend/pages/pagesGeruest/pagesgerues.dart';

class appBasic extends StatefulWidget {
  @override
  _appBasicState createState() => _appBasicState();
}

class _appBasicState extends State<appBasic> {
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Termino',
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        //nötig um cupertino und matrerial zu mischen ? aber geht iwie ned fml nehmm  ihc haklt cupertino segmented controll
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      
      
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: Colourpalette.backgroundhellbeigeGrau,
        textTheme: CupertinoTextThemeData(
            tabLabelTextStyle: Textstyle.tabLabelTextStyle),
        barBackgroundColor: Colourpalette.hellbeigeGrau,
        primaryColor: Colourpalette.dunkelbeigeGrau,
        primaryContrastingColor: Colourpalette.terminoschwarz,
      ),
      
      home: PagesGeruest(),
    );
  }
}
