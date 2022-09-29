import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    onPressed: () {},
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
//--------------------------api shiat zum aufrufen der termin teilnehmen page------------------------------------

  void _fetchMeeting(String id) async {
    meetingRepostiory.getMeetingById(id).then((meeting) {
      widget.geholtesMeeting = meeting;
    });
  }
}
