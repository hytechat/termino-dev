//Kann zu einem späteren Zeitpunkt exportiert werden und als eine Dart-File erstellt werden
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String image;
  String name;
  String email;
  String phone;

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
  });

  User copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
  }) =>
      User(
        image: imagePath ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        image: json['imagePath'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': image,
        'name': name,
        'email': email,
        'phone': phone,
      };
}

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:
        "https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png",
    name: 'Admin',
    email: 'Admin@gmail.com',
    phone: '(208) 206-5039',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
