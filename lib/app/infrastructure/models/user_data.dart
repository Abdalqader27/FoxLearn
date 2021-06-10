// To parse this JSON data, do
//
//     final userAccount = userAccountFromJson(jsonString);

import 'dart:convert';

UserAccount userAccountFromJson(String str) =>
    UserAccount.fromJson(json.decode(str));

String userAccountToJson(UserAccount data) => json.encode(data.toJson());

class UserAccount {
  UserAccount({
    required this.id,
    required this.userName,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.dob,
    required this.deviceToken,
    required this.token,
  });

  int id;
  dynamic userName;
  String name;
  String email;
  String phone;
  String password;
  DateTime dob;
  String deviceToken;
  String token;

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        id: json["id"],
        userName: json["userName"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        dob: DateTime.parse(json["dob"]),
        deviceToken: json["deviceToken"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "dob": dob.toIso8601String(),
        "deviceToken": deviceToken,
        "token": token,
      };
}
