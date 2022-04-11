import 'package:flutter/cupertino.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'package:termino_frontend/data/model/meeting_model.dart';
import 'package:termino_frontend/data/repository/meeting_repository.dart';
import 'package:termino_frontend/pages/abstimmung_teilnehmen_popUP/viewsa/abstimmung_teilnehmen_page.dart';

class HomePage extends StatefulWidget {
  late MeetingModel geholtesMeeting;
  // var _datumTestVar;
  // var _datumsArray;

  @override
  _HomePageState createState() => _HomePageState();
}

//test

class _HomePageState extends State<HomePage> {
  final MeetingRepostiory meetingRepostiory = JsonMeetingRepository();

  @override
  Widget build(BuildContext context) {
    _fetchMeeting('666');
    return Container(
        color: Colourpalette.backgroundhellbeigeGrau,
        child: Column(
          children: [
            IconsGoogle.personIcon,
            basicButton(
              'Abstimmung teilnehmen Test',
              false,
              () => showCupertinoModalPopup(
                //whs nicht die beste variante um das aufzurufen
                useRootNavigator: true,
                barrierDismissible: false,
                context: context,
                builder: (_) => AbstimmugTeilnehmenPage(
                  seitenTitel: 'Abstimmung Teilnehmen',
                  geholtesMeeting: widget.geholtesMeeting,
                ),
              ),
            ),
          ],
        ));
  }
//--------------------------api shiat zum aufrufen der termin teilnehmen page------------------------------------

  void _fetchMeeting(String id) async {
    meetingRepostiory.getMeetingById(id).then((meeting) {
      widget.geholtesMeeting = meeting;
    });
  }
}
