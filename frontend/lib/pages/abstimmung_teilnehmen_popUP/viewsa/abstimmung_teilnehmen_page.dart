import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:intl/intl.dart';
import 'package:termino_frontend/data/model/meeting_model.dart';
import 'package:termino_frontend/pages/abstimmung_teilnehmen_popUP/widgets/termin_auswahl_button.dart';

class AbstimmugTeilnehmenPage extends StatefulWidget {
  String seitenTitel = "";
  MeetingModel geholtesMeeting;

  //----- mmuss eigentlich mit anderer api aufgerufen werden oder ein user objekt in der app mitlaufemn
  bool eingeloggterUser = false;
  String userName = "Tessa Termino";
  String userEmail = "tessa.termino@gmail.com";
  //------------------------------------------------------------------------------------------------------

  AbstimmugTeilnehmenPage(
      {Key? key, required this.seitenTitel, required this.geholtesMeeting})
      : super(key: key);

  @override
  _AbstimmugTeilnehmenPageState createState() =>
      _AbstimmugTeilnehmenPageState();
}

class _AbstimmugTeilnehmenPageState extends State<AbstimmugTeilnehmenPage> {
  final formKey = GlobalKey<FormState>();

  final _placeController = TextEditingController();
  final _titleController = TextEditingController();

  final _organisatorController = TextEditingController();
  final _beschreibungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _FillTexteditiongController();
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            onChanged: () {
              Form.of(primaryFocus!.context!)?.save();
            },
            child: Column(children: [
              _buildSectionTermin(),
              _buildSectionOrganisator(),
              _buildSectionBeschreibung(),
              _buildTerminAuswahlSection(),
              _buildSectionEingabe(),
              _buildSaveButton(),
              _buildLeerSection(),
            ]),
          ),
        ),
      ),
      //  backgroundColor: ,
      navigationBar: BasicNavbar(widget.seitenTitel),
      resizeToAvoidBottomInset: true,
    );
  }

  Widget _buildSectionBeschreibung() {
    return CupertinoFormSection.insetGrouped(
      backgroundColor: Colourpalette.hellbeigeGrau,
      margin: const EdgeInsets.all(12),
      header: const Text('Beschreibung'),
      children: [
        CupertinoTextFormFieldRow(
          //prefix: Text('Beschreibung: '),
          placeholder: 'Beschreibung',
          controller: _beschreibungController,
          enabled: false,
          minLines: 3,
          maxLines: 20,
        ),
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
            //label: 'Organisator*in: ',
            placeholder: '',
            controller: _organisatorController,
            isEditeable: false),
      ],
    );
  }

  Widget _buildTerminAuswahlSection() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
        backgroundColor: Colourpalette.hellbeigeGrau,
        //ich nfinde das sollte iwie zamgefasst werdfen damit es überall fix gleich is
        margin: const EdgeInsets.all(12),
        header: const Text('Mögliche Termine'),

        children: widget.geholtesMeeting.options!
            .map((item) =>
                _buildEinzelneTerminAuswahl(item.startDate, item.endDate))
            .toList(),
      ),
    );
  }

  Widget _buildLeerSection() {
    return const SizedBox(
      height: 15,
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
            if (form.validate()) {
              Fluttertoast.showToast(
                  msg: "Abstimmung wird gespeichert",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.green.shade400,
                  textColor: Colors.white,
                  fontSize: 16.0);
              log('saving...');
            } else {
              log('invalid!');
              if (!form.validate()) {
                Fluttertoast.showToast(
                    msg: "Teilnehmer nicht valide",
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

  Widget _buildEinzelneTerminAuswahl(DateTime zeitpunkt, DateTime ende) {
    DateFormat formatter = DateFormat('dd.MM.yyyy, HH:mm');
    return MergeSemantics(
      child: ListTile(
        leading: TerminAuswahlButton(
          dreierAuswahl: widget.geholtesMeeting.isMaybeable,
          clickable: true,
          number: 0,
        ),
        title: Column(
          children: [
            Text(formatter.format(zeitpunkt)),
            Visibility(
              visible: !widget.geholtesMeeting.wholeday,
              child: Text(formatter.format(ende)),
            ),
          ],
        ),
        trailing: FittedBox(
            child: Row(children: [
          basicIconButton(
            IconsGoogle.teilnehmer,
            () {
              log('test');
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context));
            },
            Colors.green,
          ),
          Text('1'),
        ])),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Teilnehmer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: TerminAuswahlButton(
              dreierAuswahl: widget.geholtesMeeting.isMaybeable,
              clickable: false,
              number: 1,
            ),
            title: const Text("Morty"),
          ),
          ListTile(
            leading: TerminAuswahlButton(
              dreierAuswahl: widget.geholtesMeeting.isMaybeable,
              clickable: false,
              number: 3,
            ),
            title: const Text("Dan"),
          ),
          ListTile(
            leading: TerminAuswahlButton(
              dreierAuswahl: widget.geholtesMeeting.isMaybeable,
              clickable: false,
              number: 1,
            ),
            title: const Text("Pat"),
          ),
          ListTile(
            leading: TerminAuswahlButton(
              dreierAuswahl: widget.geholtesMeeting.isMaybeable,
              clickable: false,
              number: 1,
            ),
            title: const Text("Mark"),
          ),
          ListTile(
            leading: TerminAuswahlButton(
              dreierAuswahl: widget.geholtesMeeting.isMaybeable,
              clickable: false,
              number: 2,
            ),
            title: const Text("Alex"),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Schließen'),
        ),
      ],
    );
  }

  Widget _buildSectionTermin() {
    return CupertinoFormSection.insetGrouped(
      backgroundColor: Colourpalette.hellbeigeGrau,
      margin: const EdgeInsets.all(12),
      header: const Text('Termin'),
      children: [
        _buildTextField(
            placeholder: '', controller: _titleController, isEditeable: false),
        _buildTextField(
            placeholder: '', controller: _placeController, isEditeable: false),
      ],
    );
  }

  Widget _buildSectionEingabe() {
    // fast das selbe wie _buildSectionOrganisator bei der teen page
    return CupertinoFormSection.insetGrouped(
      backgroundColor: Colourpalette.hellbeigeGrau,
      //ich nfinde das sollte iwie zamgefasst werdfen damit es überall fix gleich is
      margin: const EdgeInsets.all(12),
      header: const Text('Teilnehmer*in'),
      children: [
        _buildTextField(
            placeholder: 'Teilnehmer',
            initialValue:
                widget.eingeloggterUser == true ? widget.userName : '',
            validator: (value) {
              if (RegExp(r"^[a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*$").hasMatch(value)) {
                return null;
              }
              return 'Ungültige Eingabe';
            }),
        Visibility(
            visible: widget.geholtesMeeting.isMailMandatory,
            child: _buildTextField(
                placeholder: 'E-Mail-Adresse',
                initialValue:
                    widget.eingeloggterUser == true ? widget.userEmail : '',
                validator: (value) {
                  if (value == null || !EmailValidator.validate(value)) {
                    //sollten wir die Validators auch in eine classe in dne configs legen ?
                    return 'Bitte geben Sie eine gültige E-Mail-Adresse ein.';
                  }
                  return null;
                })),
      ],
    );
  }

  Function(String value)? validator;
  Widget _buildTextField(
      // sollte vl auch aus der Classe gehoben werden ?
      {String? label,
      required String placeholder,
      String? initialValue,
      bool? isLastFormField,
      validator,
      bool? isEditeable,
      TextEditingController? controller}) {
    return CupertinoTextFormFieldRow(
      prefix: label == null ? null : Text(label),
      placeholder: placeholder,
      initialValue: initialValue,
      controller: controller,
      enabled: isEditeable,
      textInputAction:
          isLastFormField != null && true ? null : TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }

  void _FillTexteditiongController() {
    _placeController.text = widget.geholtesMeeting.place;
    _titleController.text = widget.geholtesMeeting.title;

    _organisatorController.text = widget.geholtesMeeting.organizerName;
    _beschreibungController.text = widget.geholtesMeeting.description;
  }
}
