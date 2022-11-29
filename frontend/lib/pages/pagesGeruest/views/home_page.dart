import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:termino_frontend/classes/meeting.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:termino_frontend/data/model/meeting_model.dart';
import 'package:termino_frontend/data/model/meeting_model.dart';
import 'package:termino_frontend/data/model/option_model.dart';
import 'package:termino_frontend/data/model/vote_model.dart';
import 'package:termino_frontend/data/repository/meeting_repository.dart';
import 'package:termino_frontend/pages/abstimmung_teilnehmen_popUP/viewsa/abstimmung_teilnehmen_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/register_page_old.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termine_einsehen_page.dart';
import 'package:termino_frontend/data/repository/meeting_repository.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {


/*Future<List<MeetingModel>> findAll() async {
    String jsonFile = await rootBundle.loadString('assets/data/one_meeting.json');
    final jsonArray = json.decode(jsonFile) as Iterable;

    List<MeetingModel> meetings =
        List<MeetingModel>.from(jsonArray.map((e) => MeetingModel.fromJson(e)));

    return Future.value(meetings);
  }
  */

@override
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MeetingRepostiory meetingRepostiory = JsonMeetingRepository();
  List <MeetingModel> _meetings = [];
  
  List <MeetingModel> _closedmeetings = [];
  List <MeetingModel> _openmeetings = [];


  @override
  void initState() {
    super.initState();

    meetingRepostiory.getMeetingList().then((meeting) => {
          setState(() => {_meetings = meeting})
        });
  }

     

@override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colourpalette.hellbeigeGrau,
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
      color: Colourpalette.hellbeigeGrau,
      child: CupertinoFormSection.insetGrouped(
        backgroundColor: Colourpalette.hellbeigeGrau,
        header: const Text('Meine  Abstimmungen'),
        children: [
          Column(
            children: _meetings
                .map((_meetings) => _buildChoose(_meetings)) 
                .toList(),

          ), 
        ],
      ),
    );
  }

  
  Widget _buildVoteFinished(MeetingModel meetings) {
     return ListTile(
      trailing: basicIconButton(
          Icon(Icons.check),
          () {} // hier muss dann das entsprechende fenster geöffnet werden
          ,
          Color.fromARGB(255, 25, 217, 31)),
      title: Text(
          meetings.title,
          style: TextStyle(
  	      fontWeight: FontWeight.bold),
           ),
          subtitle: Text('erstellt von '+meetings.organizerName),
    );
  }


   Widget _buildVoteOpen(MeetingModel meetings) {
     return ListTile(
      trailing: basicIconButton(
          Icon(Icons.hourglass_empty),
          () {} // hier muss dann das entsprechende fenster geöffnet werden
          ,
          Color.fromARGB(255, 228, 182, 56)),
      title: Text(
          meetings.title,
          style: TextStyle(
  	      fontWeight: FontWeight.bold),
           ),
          subtitle: Text('erstellt von '+meetings.organizerName),
    );
  }

  Widget _buildChoose(MeetingModel meetings) {
      if(!meetings.getStatus()!){
         return 
          _buildVoteOpen(meetings);
      } 
      else
       { 
        return
          _buildVoteFinished(meetings);
      }
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