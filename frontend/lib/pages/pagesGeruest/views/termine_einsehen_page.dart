import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:termino_frontend/config/config_expo.dart';

class TermineEinsehenPage extends StatefulWidget {
  //--------------muss natürlich noch durch objekte oder was auchg immer gemacht werden------------------------------
  List<String> meineAbstimmungen = ['1', '2'];
  List<String> teilnehmendeAbstimmungen = ['1', '2'];
  List<String> meineTermine = ['1', '2'];
  List<String> teilnehmendeTermine = ['1', '2'];
//---------------------------------------------------------------------------------------------------

  @override
  _TermineEinsehenPageState createState() => _TermineEinsehenPageState();
}

class _TermineEinsehenPageState extends State<TermineEinsehenPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        /*child: Center(*/
          child: Form(
            key: formKey,
            onChanged: () {
              Form.of(primaryFocus!.context!)?.save();
            },
            child: Column(
              children: [
                _buildSectionMeineOffeneAbstimmungen(),
                _buildSectionAbstimmungenAnDenenIchTeilnehme(),
                _buildSectionMeineTermine(),
                _buildSectionTermineAnDenenIchTeilNehme(),
              ],
            ),
          ),
        //),
      );
  }

  Widget _buildSectionMeineOffeneAbstimmungen() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
        //ich nfinde das sollte iwie zamgefasst werdfen damit es überall fix gleich is
        margin: const EdgeInsets.all(12),
        header: const Text('Meine Offenen Abstimmungen'),
        children: [
          ListTile(
            trailing:
                CupertinoButton(child: Text('View All'), onPressed: () {}),
          ),
          Column(
            children: widget.meineAbstimmungen
                .map((item) => _buildEinzelneTerminAuswahl(
                    item)) // meine Idee bei den Map funktionen wäre nur die ersten 3 oder 5 anzuzeigen und dann muss man über view all die anderen ansehen
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionAbstimmungenAnDenenIchTeilnehme() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
        //ich nfinde das sollte iwie zamgefasst werdfen damit es überall fix gleich is
        margin: const EdgeInsets.all(12),
        header: const Text('Abstimmungen an denen ich teilnehme'),
        children: [
          ListTile(
            trailing:
                CupertinoButton(child: Text('View All'), onPressed: () {}),
          ),
          Column(
            children: widget.teilnehmendeAbstimmungen
                .map((item) => _buildEinzelneTerminAuswahl(item))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionMeineTermine() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
        //ich nfinde das sollte iwie zamgefasst werdfen damit es überall fix gleich is
        margin: const EdgeInsets.all(12),
        header: const Text('Meine fixierten Termine'),
        children: [
          ListTile(
            trailing:
                CupertinoButton(child: Text('View All'), onPressed: () {}),
          ),
          Column(
            children: widget.meineTermine
                .map((item) => _buildEinzelneTerminAuswahl(item))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTermineAnDenenIchTeilNehme() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
          //ich nfinde das sollte iwie zamgefasst werdfen damit es überall fix gleich is
          margin: const EdgeInsets.all(12),
          header: const Text('Termine an denen ich teilnehme'),
          children: [
            ListTile(
              trailing:
                  CupertinoButton(child: Text('View All'), onPressed: () {}),
            ),
            Column(
              children: widget.teilnehmendeTermine
                  .map((item) => _buildEinzelneTerminAuswahl(item))
                  .toList(),
            ),
          ]),
    );
  }

  Widget _buildEinzelneTerminAuswahl(String item) {
    return ListTile(
      trailing: basicIconButton(
          Icon(Icons.arrow_back),
          () {} // hier muss dann das entsprechende fenster geöffnet werden
          ,
          Colourpalette.bundesrot),
      leading: Text('Titel der Abstimmung/Termins'),
      title: Text('zB Final date bei einem Termin'),
      subtitle: Text('Organisator ?'),
    );
  } // muss natürlich für jede section ei eigenes gebautrbwerden a´ber das mach ich dann erst mit Mockup

}
