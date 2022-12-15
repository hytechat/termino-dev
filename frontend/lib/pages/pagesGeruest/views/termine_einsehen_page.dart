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
import 'package:termino_frontend/pages/pagesGeruest/views/abstimmung_einsehen_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/register_page_old.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termine_einsehen_page.dart';
import 'package:termino_frontend/data/repository/meeting_repository.dart';
import 'dart:async' show Future, FutureOr;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:termino_frontend/config/config_expo.dart';


class TermineEinsehenPage extends StatefulWidget {


/*Future<List<MeetingModel>> findAll() async {
    String jsonFile = await rootBundle.loadString('assets/data/one_meeting.json');
    final jsonArray = json.decode(jsonFile) as Iterable;

    List<MeetingModel> meetings =
        List<MeetingModel>.from(jsonArray.map((e) => MeetingModel.fromJson(e)));

    return Future.value(meetings);
  }
  */

@override
_TermineEinsehenPageState createState() => _TermineEinsehenPageState();

}

class _TermineEinsehenPageState extends State<TermineEinsehenPage> {
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
            _buildMeineTermine(),

          ],
        ),
      ),
    );
  }

Widget _buildMeineTermine() {
    return Material(
      color: Colourpalette.hellbeigeGrau,
      child: CupertinoFormSection.insetGrouped(
        backgroundColor: Colourpalette.hellbeigeGrau,
        header: const Text('Meine  Termine'),
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

  
  Widget _buildTermin(MeetingModel meetings) {
     return ListTile (
      trailing: basicIconButton(
          Icon(Icons.import_export),
          () {
                        navigateSecondPage(AbstimmungEinsehenPage(organizer: meetings.organizerName, titel: meetings.title, place: meetings.place,options: meetings.options,));
          } // hier muss dann das entsprechende fenster geöffnet werden
          ,
          Color.fromARGB(255, 6, 6, 6)),
      title: Text(
          meetings.title,
          style: TextStyle(
  	      fontWeight: FontWeight.bold),
           ),
          subtitle: 
               Text (meetings.closedAt)
    );
  }

Widget _buildChoose(MeetingModel meetings) {
      if(meetings.getStatus() == true){
         return
          _buildTermin(meetings);
      } 
      else
       { 
        return SizedBox();
      }
      }

FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
