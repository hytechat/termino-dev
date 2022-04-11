
import 'dart:core';
import 'User.dart';
import 'Option.dart';
import 'dart:convert';

//https://flutter.dev/docs/development/data-and-backend/json

class Meeting {

  late int id;

  late String title; //late not null
  User? organizer; //organizaer ist null wenn man als Gast was macht
  late String organizerName;
  late String organizerEmail;
    
  Option? fixedDate; //ist wären abstimmungszeitraum null
    
  late String place;
  late String description;
    
  late bool isVoteAnonymous;
  late bool isMailMandatory;
  late bool isMaybeable;
  late bool isClosed;

  late DateTime createdAt;
  DateTime? closedAT; //ist bis zum festlegen des Datums null

  late List<Option> options;

  Meeting(this.id, this.title, this.organizer, this.organizerName, this.organizerEmail, 
    this.fixedDate, this.place, this.description,this.isVoteAnonymous, this.isMailMandatory,
    this.isMaybeable, this.isClosed, this.createdAt, this.closedAT, this.options);

  Meeting.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        organizer = json['organizer'],
        organizerName = json['organizerName'],
        organizerEmail = json['organizerEmail'],
        fixedDate = json['fixedDate'],
        place = json['place'],
        description = json['description'],
        isVoteAnonymous = json['isVoteAnonymous'],
        isMailMandatory = json['isMailMandatory'],
        isMaybeable = json['isMaybeable'],
        isClosed = json['isClosed'],
        createdAt = json['createdAt'],
        closedAT = json['closedAT'],
        options = json['options'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'organizer' : organizer,
        'organizerName' : organizerName,
        'organizerEmail' : organizerEmail,
        'fixedDate' : fixedDate,
        'place' : place,
        'description' : description,
        'isVoteAnonymous' : isVoteAnonymous,
        'isMailMandatory' : isMailMandatory,
        'isMaybeable' : isMaybeable,
        'isClosed' : isClosed,
        'createdAt' : createdAt,
        'closedAT' : closedAT,
        'options' : options
      };

 }

