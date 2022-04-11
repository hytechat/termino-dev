import 'package:termino_frontend/data/model/vote_model.dart';

class OptionModel {
  final String? meetingId;
  final DateTime startDate;
  final DateTime endDate;
  //final List<VoteModel>? vote;

  OptionModel({this.meetingId, required this.startDate, required this.endDate
      //this.vote
      });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
        meetingId: json['meetingId'],
        startDate: DateTime.parse(json['startDate']),
        endDate: DateTime.parse(json['endDate']));
  }

  Map<String, dynamic> toJson() {
    return {'meetingId': meetingId, 'startDate': startDate, 'endDate': endDate};
  }

  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();
    return meetingId.toString() + ';' + startDate.toString() + ';' + endDate.toString();
  }
}
