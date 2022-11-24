
class VoteModel{

  final String optionId;
  final String choice;
  final String participantName;
  final String participantEmail;

  VoteModel({required this.optionId,required this.choice, required this.participantName, required this.participantEmail});

  factory VoteModel.fromJson(Map<String, dynamic> json) {
          return VoteModel(optionId: json['optionId'], 
          choice: json['choice'],
          participantName: json['participantName'],
          participantEmail: json['participantEmail']);

  }
}