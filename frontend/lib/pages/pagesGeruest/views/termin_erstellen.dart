import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:intl/intl.dart';
import 'package:termino_frontend/data/model/meeting_model.dart';
import 'package:termino_frontend/data/model/option_model.dart';
import 'package:termino_frontend/data/repository/meeting_repository.dart';

DateTime rounduptoNext10Min(DateTime d) {
  // wenn wer bock hat kann er/sie es ja rausheben mir is wurscht ob da jetzt zu den kack 600 zeilen was dzu kommt
  print(d);
  final int deltaMinute;
  if (d.minute % 10 == 0) {
    deltaMinute = 0; // go back to zero
  } else {
    deltaMinute = 10 - (d.minute) % 10;
  }
  print(deltaMinute);
  return d.add(Duration(
      milliseconds: -d.millisecond,
      // reset milliseconds to zero
      microseconds: -d.microsecond,
      // reset microseconds to zero,
      seconds: -d.second,
      // reset seconds to zero
      minutes: deltaMinute));
}

class TerminErstellenPage extends StatefulWidget {
  TerminErstellenPage({Key? key}) : super(key: key);
  final DateTime _initialDateTime = rounduptoNext10Min(DateTime.now());

  Duration meetingdauer = Duration.zero;
  DateTime dateTime = rounduptoNext10Min(DateTime.now());
  List<DateTime> daten = [];
  // bool ganztagsToggle = false;

  bool eingeloggterUser = true;
  String userName = "Tessa Termino";
  String userEmail = "tessa.termino@gmail.com";

  bool datenschutzAccept = true;
  bool datenschutzNotAccept = false;

  var termine = 0;

  bool isGanztagsTermineVisible = true;
  bool isOptionsVisible = false;

  @override
  _TerminErstellenPageState createState() => _TerminErstellenPageState();
}

class _BooleanWrapper {
  bool value = false;
  _BooleanWrapper(this.value);
  void switchValue() {
    value = !value;
  }
}

class _TerminErstellenPageState extends State<TerminErstellenPage> {
  final formKey = GlobalKey<FormState>();

  final _isOptionen = _BooleanWrapper(false);
  final _isAnonymous = _BooleanWrapper(false);
  final _isMayable = _BooleanWrapper(false);
  final _isEmailOptional = _BooleanWrapper(false);
  final _isDatenschutzGelesen = _BooleanWrapper(true);
  final _isDatenschutzNichtGelesen = _BooleanWrapper(false);
  final _isGanzTagTermin = _BooleanWrapper(false);
  final MeetingRepostiory repostiory = JsonMeetingRepository();

  String title = "";
  String place = "";
  String description = "";
  String organizerName = "";
  String organizerEmail = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CupertinoPageScaffold(
        backgroundColor: Colourpalette.hellbeigeGrau,
        child: Center(
          child: Form(
            key: formKey,
            onChanged: () {
              Form.of(primaryFocus!.context!)?.save();
            },
            child: Column(
              children: [
                _buildSectionTermin(),
                _buildSectionOrganisator(),
                _buildTerminWahlsection2(),
                _buildAusgewaehlteTermine(),
                _buildTerminButton(),
                _buildLeerSection(),
                _buildSectionBeschreibung(),
                _buildSectionOptions(),
                _buildSaveButton(),
                _buildLeerSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTerminWahlsection2() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
        backgroundColor: Colourpalette.hellbeigeGrau,
        margin: const EdgeInsets.all(12),
        header: const Text('Termin Auswahl'),
        children: [
          _buildOption(
            title: 'Ganztagstermine',
            subtitle: "Termine für den ganzen Tag.",
            stateValue: _isGanzTagTermin,
            datenschutz: false,
            ganztagstermin: true,
            optionen: false,
          ),
          Visibility(
            //supersexymegageil
            visible: widget.isGanztagsTermineVisible,
            child: _buildMeetingdauer(),
          )
        ],
      ),
    );
  }

  Widget _buildTerminButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      child: CupertinoButton.filled(
          disabledColor: Colourpalette.hellbeigeGrau,
          child: const Text('Termin hinzufügen'),
          onPressed: () => _showDatePicker(context)),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      child: CupertinoButton.filled(
          child: const Text('Speichern'),
          onPressed: () {
            final form = formKey.currentState!;
            if (form.validate() &&
                    _isDatenschutzGelesen.value &&
                    widget.eingeloggterUser &&
                    widget.termine > 0 ||
                !widget.eingeloggterUser &&
                    form.validate() &&
                    _isDatenschutzNichtGelesen.value &&
                    widget.termine > 0) {
              Fluttertoast.showToast(
                  msg: "Meeting wird gespeichert",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.green.shade400,
                  textColor: Colors.white,
                  fontSize: 16.0);
              log('saving...');
              //List<OptionModel> options = [];
              List<OptionModel> options = [];
              widget.daten.forEach((element) {
                options.add(OptionModel(startDate: element, endDate: element));
              });
              MeetingModel neuesMeeting = MeetingModel(
                id: "",
                title: title,
                place: place,
                description: description,
                organizerName: organizerName,
                organizerEmail: organizerEmail,
                isVoteAnonymous: _isAnonymous.value,
                isMailMandatory: _isEmailOptional.value,
                isMaybeable: _isMayable.value,
                wholeday: _isGanzTagTermin.value,
                closedAt: "",
                isClosed: false
                //,
                //options: options
              );
              log(neuesMeeting.toString());
              repostiory.saveMeeting(neuesMeeting);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
              widget.termine = 0;
              widget.daten.clear();
            } else {
              log('invalid!');
              if (widget.termine <= 0) {
                Fluttertoast.showToast(
                    msg: "Wählen Sie mindestens 1 Termin",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if (!form.validate()) {
                Fluttertoast.showToast(
                    msg: "Textfelder nicht valide",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if (widget.eingeloggterUser &&
                  !_isDatenschutzGelesen.value) {
                Fluttertoast.showToast(
                    msg: "Datenschutzerklärung akzeptieren",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if (!widget.eingeloggterUser &&
                  !_isDatenschutzNichtGelesen.value) {
                Fluttertoast.showToast(
                    msg: "Datenschutzerklärung akzeptieren",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          }),
    );
  }

  Widget _buildMeetingdauer() {
    return MergeSemantics(
      child: ListTile(
        title: const Text('Meetingdauer'),
        subtitle: const Text('Wie lange dauert der Termin?'),
        trailing: CupertinoButton(
            child: Text(
              widget.meetingdauer == Duration.zero
                  ? '00:00'
                  : widget.meetingdauer.toString().split('.')[0],
              style: const TextStyle(color: Colors.black),
            ),
            onPressed: () => _showDurationPicker(context)),
        onTap: () {},
      ),
    );
  }

  Widget _buildAusgewaehlteTermine() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
        backgroundColor: Colourpalette.hellbeigeGrau,
        margin: const EdgeInsets.all(12),
        header: const Text('Ausgewählten Termine:'),
        children: [
          getTextWidgets(widget.daten), //markus funktion/methode
          //Divider(),
        ],
      ),
    );
  }

  Widget _buildSectionOptions() {
    //material dann formsecttion macht dass das Formfiel abgerundet ist und nicht eckig so wie bei den anderen sachen
    return Material(
      child: CupertinoFormSection.insetGrouped(
        backgroundColor: Colourpalette.hellbeigeGrau,
        margin: const EdgeInsets.all(12),
        header: const Text('Options'),
        children: [
          _buildOption(
              title: 'Zusätzliche Optionen',
              subtitle: widget.isOptionsVisible
                  ? "Zusätzliche Optionen sind eingeblendet"
                  : "Zusätzliche Optionen sind ausgeblendet",
              stateValue: _isOptionen,
              datenschutz: false,
              ganztagstermin: false,
              optionen: true),
          Visibility(
              visible: widget.isOptionsVisible,
              child: _buildOption(
                  title: 'Anonyme Umfrage',
                  subtitle: _isAnonymous.value
                      ? "Namen der Teilnehmer werden verborgen"
                      : "Namen der Teilnehmer werden angezeigt",
                  stateValue: _isAnonymous,
                  datenschutz: false,
                  ganztagstermin: false,
                  optionen: false)),
          Visibility(
              visible: widget.isOptionsVisible,
              child: _buildOption(
                  title: 'E-Mail Adresse',
                  subtitle: _isEmailOptional.value
                      ? "E-mail Adresse muss angegeben werden"
                      : "Keine E-Mail Adresse notwendig",
                  stateValue: _isEmailOptional,
                  datenschutz: false,
                  ganztagstermin: false,
                  optionen: false)),
          Visibility(
              visible: widget.isOptionsVisible,
              child: _buildOption(
                  title: 'Vielleicht Option',
                  subtitle: _isMayable.value
                      ? "Ja, Nein und Vielleicht kann gewählt werden"
                      : "Ja und Nein können gewählt werden",
                  stateValue: _isMayable,
                  datenschutz: false,
                  ganztagstermin: false,
                  optionen: false)),
          _buildOption(
              title: 'Datenschutzerklärung',
              subtitle:
                  _isDatenschutzGelesen.value && widget.eingeloggterUser ||
                          _isDatenschutzNichtGelesen.value &&
                              !widget.eingeloggterUser
                      ? "Gelesen und akzeptiert"
                      : "Muss akzeptiert werden",
              stateValue: widget.eingeloggterUser == true
                  ? _isDatenschutzGelesen
                  : _isDatenschutzNichtGelesen,
              datenschutz: true,
              ganztagstermin: false,
              optionen: false),
        ],
      ),
    );
  }

  Widget _buildOption(
      {required String title,
      required String subtitle,
      required _BooleanWrapper stateValue,
      required bool datenschutz,
      required bool ganztagstermin,
      required bool optionen}) {
    return MergeSemantics(
      child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: CupertinoSwitch(
            value: stateValue.value,
            onChanged: (bool value) {
              if (datenschutz) {
                _isDatenschutzGelesen.value = !_isDatenschutzGelesen.value;
                _isDatenschutzNichtGelesen.value =
                    !_isDatenschutzNichtGelesen.value;
                log(title + ': ' + value.toString());
              }
              if (ganztagstermin) {
                log(title + ': ' + value.toString());
                widget.isGanztagsTermineVisible =
                    !widget.isGanztagsTermineVisible;
              }
              if (optionen) {
                log(title + ': ' + value.toString());
                widget.isOptionsVisible = !widget.isOptionsVisible;
              }
              setState(() {
                stateValue.value = value;
              });
            },
          ),
          onTap: () {
            if (datenschutz) {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    navigationBar: BasicNavbar('Datenschutzerklärung'),
                    child: Expanded(
                      child: SfPdfViewer.asset(
                        'assets/empty.pdf',
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }

  Widget _buildSectionTermin() {
    return CupertinoFormSection.insetGrouped(
      backgroundColor: Colourpalette.hellbeigeGrau,
      margin: const EdgeInsets.all(12),
      header: const Text('Termin'),
      children: [
        _buildTextField(
            placeholder: 'Titel des Termins',
            validator: (inpTitle) {
              if (RegExp(r"^[a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*$")
                  .hasMatch(inpTitle)) {
                title = inpTitle;
                return null;
              }
              return 'Ungültige Eingabe';
            }),
        _buildTextField(
            placeholder: 'Ort',
            validator: (inpPlace) {
              if (RegExp(r"^[a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*$")
                  .hasMatch(inpPlace)) {
                place = inpPlace;
                return null;
              }
              return 'Ungültige Eingabe';
            }),
      ],
    );
  }

  Widget _buildSectionOrganisator() {
    return CupertinoFormSection.insetGrouped(
      backgroundColor: Colourpalette.hellbeigeGrau,
      margin: const EdgeInsets.all(12),
      header: const Text('Organisator*in'),
      children: [
        _buildTextField(
            placeholder: 'Organisator',
            initialValue:
                widget.eingeloggterUser == true ? widget.userName : '',
            validator: (inpOrganizer) {
              if (RegExp(r"^[a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*$")
                  .hasMatch(inpOrganizer)) {
                organizerName = inpOrganizer;
                return null;
              }
              return 'Ungültige Eingabe';
            }),
        _buildTextField(
            placeholder: 'E-Mail-Adresse des Organisators',
            initialValue:
                widget.eingeloggterUser == true ? widget.userEmail : '',
            validator: (inpOrganizerMail) {
              if (!EmailValidator.validate(inpOrganizerMail)) {
                return 'Bitte geben Sie eine gültige E-Mail-Adresse ein.';
              } else {
                organizerEmail = inpOrganizerMail;
                return null;
              }
            }),
      ],
    );
  }

  Widget _buildLeerSection() {
    return const SizedBox(
      height: 15,
    );
  }

  Widget _buildSectionBeschreibung() {
    return CupertinoFormSection.insetGrouped(
      backgroundColor: Colourpalette.hellbeigeGrau,
      margin: const EdgeInsets.all(12),
      header: const Text('Beschreibung'),
      children: [
        CupertinoTextFormFieldRow(
          placeholder: 'Beschreibung',
          minLines: 3,
          maxLines: 20,
          validator: (inpDescription) {
            description = inpDescription!;
            return null;
          },
        ),
      ],
    );
  }

  void _showDurationPicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 500,
        color: const Color.fromARGB(255, 255, 255, 255), // hf Patricia :*
        child: Column(
          children: [
            Container(
              height: 400,
              child: CupertinoTimerPicker(
                minuteInterval: 15,
                mode: CupertinoTimerPickerMode.hm,
                onTimerDurationChanged: (val) {
                  setState(
                    () {
                      widget.meetingdauer = val;
                    },
                  );
                },
              ),
            ),

            // Close the modal
            CupertinoButton(
              child:
                  const Text('OK', style: const TextStyle(color: Colors.black)),
              onPressed: () {
                (DateTime derzeitigesDate, List<DateTime> datenListe,
                    bool ganztagstoggleUebergabe, Duration meetingDauerino) {
                  setState(() {
                    widget.meetingdauer = meetingDauerino;
                    // widget.ganztagsToggle = ganztagstoggleUebergabe;
                    widget.daten = datenListe;
                    widget.dateTime = derzeitigesDate;
                  });
                };
                Navigator.of(ctx, rootNavigator: true)
                    .pop(); //yaaaas jetzt killed er das richtige
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 500,
        color: Colourpalette.backgroundhellbeigeGrau,
        child: Column(
          children: [
            Container(
              height: 400,
              child: CupertinoDatePicker(
                initialDateTime: widget.dateTime,
                use24hFormat: true,
                minuteInterval: 10,
                minimumDate: widget._initialDateTime,
                mode: _isGanzTagTermin.value
                    ? CupertinoDatePickerMode.date
                    : CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (val) {
                  setState(
                    () {
                      widget.dateTime = val;
                      print('drehen whui' + widget.dateTime.toString());
                    },
                  );
                },
              ),
            ),

            // Close the modal
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () {
                setState(
                  () {
                    widget.daten.add(widget.dateTime);
                    widget.dateTime =
                        widget.dateTime.add(const Duration(minutes: 10));
                  },
                );
                Navigator.of(ctx, rootNavigator: true)
                    .pop(); //yaaaas jetzt killed er das richtige
                widget.termine++;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextWidgets(List<DateTime> dates) {
    //hier werden die datums ergebnisfelder gebuilded #thx markus
    DateFormat formatter = DateFormat('dd.MM.yyyy, HH:mm');
    return Column(
      children: dates
          .map(
            (item) => Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colourpalette.backgroundhellbeigeGrau,
              ),
              margin: const EdgeInsets.all(12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //SizedBox(width: 5,),
                          const Text(
                            'Start:',
                            style: Textstyle.textboxstyle,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          
                          Text(formatter.format(item),
                          style: Textstyle.textboxstyle,
                          ),
                              
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Visibility(
                        visible: !_isGanzTagTermin.value,
                        child: Row(
                          children: [
                            const Text(
                              'Ende:',
                              style: Textstyle.textboxstyle,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            //Divider(thickness: 3 ,height: 20, color: Colourpalette.bundesrot,),
                            Text(
                            formatter.format(item.add(widget.meetingdauer)),
                              style: Textstyle.textboxstyle,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          basicIconButton(
                              //sollte der termin löschen button werden, brauchen wir einen bearbeiten Button auch dann würde ich in dem einfach die befehle füpr löschen und neu nacheinander ausführen
                              IconsGoogle.loesch, () {
                            setState(() {
                              dates.remove(item);
                              widget.termine--;
                            });
                          }, Colourpalette.bundesrot),
                          basicIconButton(
                              //sollte der termin löschen button werden, brauchen wir einen bearbeiten Button auch dann würde ich in dem einfach die befehle füpr löschen und neu nacheinander ausführen
                              IconsGoogle.change, () {
                            setState(() {
                              dates.remove(item);
                              widget.dateTime = item;
                              _showDatePicker(context);
                            });
                          }, Colourpalette.bundesrot),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                ],
                //mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
          )
          .toList(),
    );
  }

  Function(String value)? validator;
  Widget _buildTextField(
      {String? label,
      required String placeholder,
      String? initialValue,
      bool? isLastFormField,
      validator}) {
    return CupertinoTextFormFieldRow(
      prefix: label == null ? null : Text(label),
      placeholder: placeholder,
      initialValue: initialValue,
      textInputAction:
          isLastFormField != null && true ? null : TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
