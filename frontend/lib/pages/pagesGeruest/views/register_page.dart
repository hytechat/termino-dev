import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  //Booleans um Passwort aufzudecken
  bool _obscureText = true;
  bool _obscureText2 = true;

  //Controller um User Input zu holen
  final UserController = TextEditingController();
  final MailController = TextEditingController();
  final PasswController = TextEditingController();
  final PassWdhController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    UserController.dispose();
    MailController.dispose();
    PasswController.dispose();
    PassWdhController.dispose();
    super.dispose();
  }

  //Platzhalter, damit Controller angesteuert werden können
  String mail = '';
  String passwort = '';
  String pwWdh = '';
  String username = '';

  bool? _checkBoxListTile = false; //? macht Bool nullable

  void datenschutzMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: const [
              Text(
                'Fehler!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Sie müssen der Datenschutzerklärung zustimmen!',
                style: TextStyle(fontSize: 14, color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  var defaultText = const TextStyle(color: Colors.black);
  var linkText = const TextStyle(color: Colors.blue);

  final Uri _url = Uri.parse('https://www.bmf.gv.at/public/datenschutz.html');

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              const Text(
                "Registrierung",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: UserController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Benutzername',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld darf nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9]').hasMatch(value)) {
                      return "Dieser Name entspricht nicht den Richtlinien!"; //To be defined was die Guidelines sind - generell was hier alles zulässig sein darf
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: MailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'E-Mail Adresse',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld darf nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Diese E-Mail Adresse ist ungültig!";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: PasswController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Passwort',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld darf nicht leer sein!";
                    } else if (value!.isEmpty ||
                        !RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)')
                            .hasMatch(value!)) {
                      return "Notwendig sind: Groß-, Kleinbuchstabe, Zahl und Sonderzeichen!";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  obscureText: _obscureText2,
                  controller: PassWdhController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                      child: Icon(_obscureText2
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 230, 230, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Passwort wiederholen',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Das Feld darf nicht leer sein!";
                    } else if (PassWdhController.text != PasswController.text) {
                      return "Die Passwörter stimme nicht überein!";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 25,
              ),
              const Text('Ich habe die'),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Datenschutzerklärung'),
                      content: const SingleChildScrollView(child:
                      Text('Allgemein \n \n Für das Bundesministerium für Finanzen hat ein verantwortungsbewusster Umgang mit personenbezogenen Daten hohe Priorität. Wir möchten, dass Sie wissen, wann wir welche Daten erheben und wie wir sie verwenden. \n \n Wir haben technische und organisatorische Maßnahmen getroffen, die sicherstellen, dass die Vorschriften über den Datenschutz sowohl von uns als auch von unseren externen Dienstleistern beachtet werden. \n \n Im Zuge der Weiterentwicklung unserer Webseiten und der Implementierung neuer Technologien können Änderungen dieser Datenschutzerklärung erforderlich werden. Daher empfehlen wir Ihnen, sich diese Datenschutzerklärung ab und zu erneut durchzulesen. \n \n Rechtsgrundlagen \n \n Die Anwendung TERMINO, die vom Bundesministerium für Finanzen bereitgestellt wird, speichert und verarbeitet Daten im Sinne des österreichischen Bundesgesetzes zum Schutz natürlicher Personen bei der Verarbeitung personenbezogener Daten (Datenschutzgesetz - DSG) idgF. Die Speicherung und Verarbeitung der Daten erfolgt ausschließlich in Österreich. \n \n Seit 25. Mai 2018 unterliegen die Daten den Bestimmungen der Verordnung (EU) 2016/679 des Europäischen Parlaments und des Rates vom 27. April 2016 zum Schutz natürlicher Personen bei der Verarbeitung personenbezogener Daten, zum freien Datenverkehr und zur Aufhebung der Richtlinie 95/46/EG (Datenschutz-Grundverordnung - DSGVO) sowie dem durch das Datenschutz-Anpassungsgesetz 2018 novellierten Datenschutzgesetz. Die Verarbeitung der Daten zu den unten angeführten Zwecken stützt sich auf Ihre Einwilligung gemäß Art. 6 Abs. 1 lit. a DSGVO. \n \n Ihre Rechte \n \n Ihnen stehen grundsätzlich die Rechte auf Auskunft, Berichtigung, Löschung, Einschränkung, Datenübertragbarkeit, Widerruf und Widerspruch zu. Wenn Sie glauben, dass die Verarbeitung Ihrer Daten gegen das Datenschutzrecht verstößt oder Ihre datenschutzrechtlichen Ansprüche in anderer Weise verletzt worden sein könnten, haben Sie die Möglichkeit, sich bei der Aufsichtsbehörde zu beschweren. In Österreich ist das die Datenschutzbehörde (Barichgasse 40-42, 1030 Wien, Telefon: +43 1 52 152-0, E-Mail: dsb@dsb.gv.at). \n \n Personenbezogene Daten, die Sie uns bekanntgeben \n \nDaten, die Sie uns bekannt geben, werden von unseren fachverantwortlichen Mitarbeiterinnen und Mitarbeitern und unseren beauftragten IT-Dienstleistern verantwortungsvoll behandelt und nur im Sinne und zum Zweck der Anwendung genutzt. \n \n Verarbeitung von Daten \n \n Ihre personenbezogenen Daten werden für folgende Zwecke verarbeitet: \n \n Die Erstellung einer Terminabfrage erfordert die Angabe einer E-Mail Adresse zur Zusendung des Links zur Terminabstimmung. Eine darüber hinausgehende Identifikation kann durch eine Registrierung oder durch den Portalverbund erfolgen, womit auch früher gespeicherte Terminabstimmungen abrufbar sind. Für jene Personen, die an einer Terminabstimmung teilnehmen, ist die Angabe einer E-Mail Adresse optional. Sie wird empfohlen, falls die Zusendung des fixierten Termins erwünscht ist. \n \n Abgestimmte Termine werden drei Monate nach dem fixierten Datum gelöscht, nicht abgeschlossene Terminabstimmungen ein halbes Jahr nach ihrer letzten Bearbeitung. \n \n Bei Buchungslisten wird nach einem Jahr der letzten Bearbeitung ein Löschhinweis an den/die Ersteller:in per E-Mail gesendet. Darin enthalten ist ein Hinweis, dass nach weiteren 30 Tagen die Buchungsliste gelöscht wird, außer es erfolgt eine Anmeldung und die Buchungsliste wird neu abgespeichert. \n \n Jeder Eintrag bei der Erstellung eines Termins oder der Zu- oder Absage wird protokolliert, allerdings nur die Aktivität mit Zeitstempel ohne der IP-Adresse. Missbräuchliche Nutzung kann eine technische Zugangssperre nach sich ziehen. \n \n Jede:r Benutzer:in kann das eigene Konto selbst löschen. Siehe dazu folgenden FAQ-Eintrag. \n \n Cookies \n \n Cookies sind kleine Textdateien, die lokal im Zwischenspeicher des Internet-Browsers auf Ihrem Computer gespeichert werden, wenn Sie die Webseite besuchen. Die Cookies ermöglichen die Wiedererkennung des Internet-Browsers. \n \n Sie können den Einsatz und den Umfang von Cookies durch Ihre Computereinstellung selbst bestimmen. Sie können Ihren Computer so einstellen, dass Sie jedes Mal gewarnt werden, wenn ein Cookie übertragen wird, oder alle Cookies deaktivieren. Das Löschen oder das Blockieren der Cookies kann allerdings dazu führen, dass Ihnen einzelne Funktionen dieser Website nicht mehr zur Verfügung stehen. Im Hilfe-Menü Ihres Browsers erfahren Sie, wie Sie Ihre Cookies richtig verändern oder aktualisieren. \n \n termino.gv.at setzt ein technisch notwendiges Cookie mit dem Namen „has_js“ zur Leistungsverbesserung der Webseite, das feststellt, ob JavaScript verfügbar ist oder nicht. Das Cookie wird nur bis zum jeweiligen Sitzungsende gespeichert. \n \n Außerdem wird von termino.gv.at ein technisch notwendiges Cookie mit dem Namen „SESSxxx“ (xxx steht für eine Folge von Ziffern und Buchstaben) zur Sicherung der laufenden Sitzung gesetzt, wenn Sie sich bei termino.gv.at anmelden. Das Cookie wird nur bis zum jeweiligen Sitzungsende gespeichert. \n \n Statistiken zur Nutzung der Webseite werden mit der Open Source Software Matomo erstellt, welche auf demselben Server läuft. Eine Weitergabe der Daten an Dritte erfolgt nicht.  Matomo setzt dazu keine Cookies ein, IP-Adressen werden anonymisiert. Die Statistiken werden zum Zweck der Analyse des Surfverhaltens auf der Webseite verwendet. Dadurch kann die Nutzerfreundlichkeit der Webseite optimiert werden. Die Rechtmäßigkeit der Verarbeitung gemäß Art. 6 Abs. 1 lit. f DSGVO ergibt sich aus dem Umstand, dass die Verarbeitung zur Wahrung der berechtigten Interessen des Verantwortlichen erforderlich ist, um die Nutzererfahrung zu verbessern. Außerdem erfolgt eine Anonymisierung der IP-Adresse durch die Maskierung von Teilen der IP-Adresse. \n \n Eine Anfrage über das Feedbackformular wird zum Zwecke der Anfragebeantwortung an den Diensterbringer und gegebenenfalls an einen Dienstleister, welcher diesen unterstützt, als E-Mail gesendet und wird nicht auf dem TERMINO Server gespeichert. \n \n Weitergabe personenbezogener Daten an Dritte \n \n Daten, die beim Zugriff auf TERMINO protokolliert wurden, werden an Dritte nur übermittelt, soweit wir gesetzlich oder durch Gerichtsentscheidung dazu verpflichtet sind oder dies im Falle von Angriffen auf die Internetinfrastruktur zur Rechts- oder Strafverfolgung erforderlich ist. \n \n Eine Weitergabe von Daten an Dritte zu kommerziellen oder nichtkommerziellen Zwecken findet darüber hinaus ohne Ihre ausdrückliche Einwilligung nicht statt. \n \n Minderjährigenschutz \n \n Personen unter 14 Jahren sollten ohne Zustimmung der Eltern oder Erziehungsberechtigten keine personenbezogenen Daten an uns übermitteln. Wissentlich sammeln wir solche Daten nicht und geben sie auch nicht an Dritte weiter. \n \n Kontakt \n \n E-Mail: service@termino.gv.at'),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Ok'),
                          onPressed: () => Navigator.pop(context),
                        )

                      ],
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    foregroundColor: Color.fromRGBO(46, 88, 235, 1)),
                child: const Text(
                  'Datenschutzerklärung',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              CheckboxListTile(
                value: _checkBoxListTile,
                title:
                    const Text(
                        "gelesen und bin einverstanden, dass die Daten zum Zwecke der Terminabstimmung gespeichert werden."),
                onChanged: (val) {
                  setState(() {
                    _checkBoxListTile = val;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: const EdgeInsets.symmetric(
                    //  horizontal: 40.0, vertical: 20.0),
                    backgroundColor: const Color.fromRGBO(195, 16, 4, 1),
                    minimumSize: const Size.fromHeight(2),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        _checkBoxListTile == true) {
                      Navigator.pushReplacementNamed(context, '/login');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Ihnen wird eine Mail zugesendet um die Registrierung abzuschließen!',
                              style: TextStyle(fontSize: 15)),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else if (formKey.currentState!.validate() &&
                        _checkBoxListTile == false) {
                      datenschutzMessage();
                    }
                  },
                  child: const Text(
                    "Registrieren",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (_) => false);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromRGBO(46, 88, 235, 1),
                ),
                child: const Text(
                  'Zurück',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
