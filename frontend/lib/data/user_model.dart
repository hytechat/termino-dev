class UserModel {
  int userID;
  String userName;
  String firstName;
  String lastName;
  String email;
  String token;
  String renewalToken;

  UserModel(
      {required this.userID,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.token,
      required this.renewalToken});

  factory UserModel.fromJson(Map<String, dynamic> responseData) {
    return UserModel(
        userID: responseData['id'],
        userName: responseData['username'],
        firstName: responseData['firstname'],
        lastName: responseData['lastname'],
        email: responseData['email'],
        token: responseData['token'],
        renewalToken: responseData['renewalToken']);
  }
}
