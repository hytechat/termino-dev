import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:termino_frontend/config/globale_widgets/basic_vorlese_button.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/login_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termin_erstellen.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/views.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/faq_page.dart';

class PagesGeruest extends StatefulWidget {
  @override
  _PagesGeruestState createState() => _PagesGeruestState();
}

class _PagesGeruestState extends State<PagesGeruest> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          _buildNavBar(), //Farbe ist nur zum test auchn die navbar könnte evtl usgelagert werden? und natürlich fehlen noch die buttons

      child: CupertinoTabScaffold(
          resizeToAvoidBottomInset: true,
          tabBar: createUniversalTabBar(),
          tabBuilder: (context, index) {
            late final Widget returnWidget;
            switch (index) {
              //tbh weiß ned ob das auf die art und weise das betse ist tutorial wäre das vl ned schlecht https://codelabs.developers.google.com/codelabs/flutter-cupertino#2 is auch im lernpfadd
              case 0:
                returnWidget = HomePage();
                break;
              case 1:
                returnWidget = TerminErstellenPage();
                break;
              case 2:
                returnWidget = TermineEinsehenPage();
                break;
              case 3:
                //returnWidget = ProfilEinsehenPage();
                returnWidget = const FaqPage();
                break;
            }

            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: returnWidget,
              );
            });

            // return returnValue;
          }),
    );
  }

//-------------------------------------------------------------------------------------------------------------
  CupertinoNavigationBar _buildNavBar() => CupertinoNavigationBar(
        //--> aufbau d3er classsic nav bar
        backgroundColor: Colourpalette.hellbeigeGrau,
        leading: _buildNavButtonContainer(
            //  conatiner -> dankbares widget in dem man als child fast jedes andere widget geben kann und in größe etc einschränken :D
            4,
            BasicVorleseButton()),
        middle: _buildNavButtonContainer(
          10,
          Image.asset('assets/terminoLogo.png'),
        ), // jedes bild muss im yaml file  eingetragen werden außer das mit dem directory funst ...... hat aber bei mir ned funktioniert
        trailing: _buildNavButtonContainer(
          4,
          basicIconButton(IconsGoogle.searchIcon, () {
            testAlert(context);
          }, Colourpalette.bundesrot),
        ),
      );

  Container _buildNavButtonContainer(double inset, Widget kind) {
    return Container(
      padding: EdgeInsets.all(inset),
      child: kind,

      // hier kann man dann noch alle eigenschaften dazu geben die man bei dne Buttons auch haben mag --> natürlich bei allen buttons eig Container gleich
    );
  }

//--------------------------------------------------------zu prüfen ist ob das ned in eigene files /klassen transferrierbar ist und wie das dann aufgerufen wird..............
  CupertinoTabBar createUniversalTabBar() {
    return CupertinoTabBar(
      activeColor: Colourpalette.terminoschwarz,
      currentIndex: 0,
      backgroundColor: Colourpalette.dunkelbeigeGrau,
      iconSize: 35,
      inactiveColor: Colourpalette.terminoGrau,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconsGoogle
              .homeIcon, // hier werden die google oder cupertino icons implementiert wenn gewollt kann das mit if entschieden werden
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconsGoogle.plusIcon,
          label: 'Neu',
        ),
        BottomNavigationBarItem(
          icon: IconsGoogle.terminIcon,
          label: 'Termine',
        ),
        BottomNavigationBarItem(
          icon: IconsGoogle.personIcon,
          label: 'Profil',
        ),
      ],
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
