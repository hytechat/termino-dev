import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:termino_frontend/data/model/meeting_model.dart';

abstract class MeetingRepostiory {
  Future<List<MeetingModel>> getMeetingList();
  Future<MeetingModel> getMeetingById(String id);
  Future<MeetingModel> saveMeeting(MeetingModel meeting);
}

class JsonMeetingRepository implements MeetingRepostiory {
  @override
  Future<List<MeetingModel>> getMeetingList() async {
    String jsonString =
        await rootBundle.loadString('lib/assets/data/meeting.json');
    final Iterable jsonArray = json.decode(jsonString);
    List<MeetingModel> meetingList = List<MeetingModel>.from(
        jsonArray.map((jsonData) => MeetingModel.fromJson(jsonData)));
    return Future.value(meetingList);
  }

  @override
  Future<MeetingModel> getMeetingById(String id) async {
    String jsonString = await rootBundle.loadString('assets/data/one_meeting.json');
    return Future.value(MeetingModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<MeetingModel> saveMeeting(MeetingModel meeting) async {
    var url = 'http://localhost:8080/meetings';
    MeetingModel ret;
    return await http.post(
      Uri.http('localhost:8080', 'meetings'),
      body: jsonEncode(meeting),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    ).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      MeetingModel r = MeetingModel.fromJson(jsonDecode(response.body));
      print(r);
      r.options?.forEach((element) {
        print(element.startDate);
        print(element.endDate);
        print(element);
      });
      return r;
    });
  }
}
