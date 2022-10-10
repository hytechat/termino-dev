import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:termino_frontend/data/model/meeting_model.dart';
import 'package:termino_frontend/data/repository/meeting_repository.dart';
import 'package:termino_frontend/pages/abstimmung_teilnehmen_popUP/viewsa/abstimmung_teilnehmen_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/register_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termine_einsehen_page.dart';


class HomePage extends StatefulWidget {
  late MeetingModel geholtesMeeting;

final List<String> meineAbstimmungen = ['AAA', 'BBB', 'CCC','DDD','EEE'];
final List<String> Date = ['01.01.2022', '01.02.2022', '01.03.2022', '01.04.2022', '01.05.2022'];


@override
 _HomePageState createState() => _HomePageState();
}

//test

class _HomePageState extends State<HomePage> {
  final MeetingRepostiory meetingRepostiory = JsonMeetingRepository();
  
  get meineAbstimmungen => null;


@override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colourpalette.backgroundhellbeigeGrau,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildMeineAbstimmungen(),

          ],
        ),
      ),
    );
  }

Widget _buildMeineAbstimmungen() {
    return Material(
      child: CupertinoFormSection.insetGrouped(
        header: const Text('Meine  Abstimmungen'),
        children: [
          Column(
            children: widget.meineAbstimmungen
                .map((item) => _buildVoteFinished(
                    item)) // meine Idee bei den Map funktionen wäre nur die ersten 3 oder 5 anzuzeigen und dann muss man über view all die anderen ansehen
                .toList(),
                
          ), 
        ],
      ),
    );
  }

  Widget _buildVoteFinished(String item) {
    return ListTile(
      trailing: basicIconButton(
          Icon(Icons.check),
          () {} // hier muss dann das entsprechende fenster geöffnet werden
          ,
          Color.fromARGB(255, 25, 217, 41)),
      title: Text(
         'Terminname',
          style: TextStyle(
  	      fontWeight: FontWeight.bold),
           ),
          subtitle: Text('24. Dezember 2022'),
    );
  }


   Widget _buildVoteOpen(String item) {
    return ListTile(
      trailing: basicIconButton(
          Icon(Icons.question_mark_rounded),
          () {} // hier muss dann das entsprechende fenster geöffnet werden
          ,
          Color.fromARGB(255, 25, 217, 41)),
      title: Text(
         'Terminname',
          style: TextStyle(
  	      fontWeight: FontWeight.bold),
           ),
          subtitle: Text('24. Dezember 2022'),
    );
  }

 


}
  /*@override
  Widget build(BuildContext context) {
    return Container(
      color: Colourpalette.backgroundhellbeigeGrau,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Log In'),
                onPressed: () {},
              )),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage()));
            },
            child: Text(
              'REGISTRIEREN',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Als Gast Fortfahren'),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
  */
 
//--------------------------api shiat zum aufrufen der termin teilnehmen page------------------------------------

  /*void _fetchMeeting(String id) async {
    meetingRepostiory.getMeetingById(id).then((meeting) {
      widget.geholtesMeeting = meeting;
    });
  }
}
*/