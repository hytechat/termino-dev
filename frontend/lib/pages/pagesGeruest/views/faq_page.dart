import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FaqPageWidget(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems() {
  return [
    Item(
        headerValue: 'Termino anonym nutzen',
        expandedValue:
            'Sowohl das Registrieren eines Benutzerkontos als auch die Eingabe einer E-Mail Adresse bei Terminabstimmungen ist optional.\nDie Nutzung ist für Teilnehmer*innen an einer Terminabstimmung also völlig anonym möglich. Wir empfehlen dennoch, sich anzumelden, weil dann auch nachträglich Terminzusagen geändert werden können.\nAllerdings ist die Hinterlegung einer E-Mail Adresse durch einladende Personen erforderlich, weil sonst der Link zum nachträglichen Bearbeiten und Fixieren des Termins nicht zugestellt werden kann.\nAuch ist bei Buchungslisten die Eingabe einer E-Mail Adresse erforderlich, weil nur so eine Buchungsbestätigung und Informationen über allfällige Stornierungen verschickt werden können.\nZusätzlich bietet die Erstellung von Buchungslisten mit Login den Vorteil, dass eine Übersicht der Buchungslisten im Konto angezeigt wird.'),
    Item(
        headerValue: 'Wozu wird die E-Mail-Adresse erhoben?',
        expandedValue:
            'Die E-Mail Adresse wird bei einladenden Personen benötigt, um den Link zum nachträglichen Bearbeiten zu schicken.\nTeilnehmer*innen einer Terminabstimmung können zu einer Angabe einer E-Mail Adresse verpflichtet werden. Denn nur dann wird an diese Adresse der fixierte Termin von TERMINO als ICAL Datei geschickt, damit der Termin bequem in den eigenen Kalender importiert werden kann. Wird die Option zur verpflichtenden Bereitstellung einer E-Mail Adresse nicht gewählt, müssen Teilnehmer*innen, die nicht auf TERMINO registriert sind, über das eigene E-Mail Programm oder einen Messenger vom Ausgang der Abstimmung informiert werden.\nBei einer Buchung ist die Angabe einer E-Mail Adresse erfoderlich, damit eine Bestätigung zugestellt und eine allfällige Stornierung durchgeführt werden kann.\nIn beiden Fällen wird die Adresse nie öffentlich angezeigt, und einzig verwendet, um diese Informationen zuzustellen.'),
  ];
}

class FaqPageWidget extends StatefulWidget {
  const FaqPageWidget({Key? key}) : super(key: key);

  @override
  State<FaqPageWidget> createState() => _FaqPageWidgetState();
}

class _FaqPageWidgetState extends State<FaqPageWidget> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: const Text('Vorlesen'),
              trailing: const Icon(Icons.earbuds),
              onTap: () {
                _speek(item);
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  void _speek(Item item) {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage('de-DE');
    flutterTts.setSpeechRate(0.5);
    flutterTts.setVolume(1.0);
    flutterTts.setPitch(1.0);
    flutterTts.speak(item.expandedValue);
  }
}