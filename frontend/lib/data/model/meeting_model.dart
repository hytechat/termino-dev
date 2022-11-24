import 'package:termino_frontend/data/model/option_model.dart';

class MeetingModel {
  final String? id;
  final String title;
  final String place;
  final String description;
  final String organizerName;
  final String organizerEmail;
  final bool isVoteAnonymous; //eigentlich bool
  final bool isMailMandatory; //eigentlich bool
  final bool isMaybeable; //eigentlich bool
  final bool wholeday; //eigentlich bool
  final bool? isClosed; //eigentlich bool
  final String? createdAt;
  final String? closedAt;
  final List<OptionModel>? options;
  //final String options; //List<OptionModel>

  MeetingModel({
    this.id,
    required this.title,
    required this.place,
    required this.description,
    required this.organizerName,
    required this.organizerEmail,
    required this.isVoteAnonymous,
    required this.isMailMandatory,
    required this.isMaybeable,
    required this.wholeday,
    required this.isClosed,
    this.createdAt,
    this.closedAt,
    this.options,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    final optionsData = json['options'] as List<dynamic>?;
    final options = optionsData != null
        ? optionsData.map((o) => OptionModel.fromJson(o)).toList()
        : <OptionModel>[];
    return MeetingModel(
        id: json['id'],
        title: json['title'],
        place: json['place'],
        description: json['description'],
        organizerName: json['organizerName'],
        organizerEmail: json['organizerEmail'],
        isVoteAnonymous: json['isVoteAnonymous'],
        isMailMandatory: json['isMailMandatory'],
        isMaybeable: json['isMaybeable'],
        wholeday: json['wholeday'],
        isClosed: json['isClosed'],
        createdAt: json['createdAt'],
        closedAt: json['closedAt'],
        options: options);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'place': place,
      'description': description,
      'organizerName': organizerName,
      'organizerEmail': organizerEmail,
      'isVoteAnonymous': isVoteAnonymous,
      'isMailMandatory': isMailMandatory,
      'isMaybeable': isMaybeable,
      'wholeday': wholeday,
      'isClosed': isClosed,
      'createdAt': createdAt,
      'closedAt': closedAt,
      if (options != null) 'options': options!.map((o) => o.toJson()).toList()
    };
  }

  String getTitle() {
    return this.title;
  }

  bool? getStatus(){
    return this.isClosed;
  }

  @override
  String toString() {
    return 'Meeting: {id: ${id},title: ${title},place: ${place},description: ${description},organizerName: ${organizerName},organizerEmail: ${organizerEmail},isVoteAnonymous: ${isVoteAnonymous},isMailMandatory: ${isMailMandatory},isMaybeable: ${isMaybeable},wholeday : ${wholeday},isClosed: ${isClosed},createdAt: ${createdAt},closedAT: ${closedAt},options: ${options}}';
  }
}
