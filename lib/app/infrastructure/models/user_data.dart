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
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.dob,
    this.token,
    this.deviceToken,
    this.s3Credentials,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  DateTime dob;
  String? token;
  String? deviceToken;
  String? s3Credentials;

  UserAccount copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? token,
    DateTime? dob,
    String? deviceToken,
    String? s3Credentials,
  }) =>
      UserAccount(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        token: token ?? this.token,
        dob: dob ?? this.dob,
        deviceToken: deviceToken ?? this.deviceToken,
        s3Credentials: s3Credentials ?? this.s3Credentials,
      );

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        token: json["token"],
        dob: DateTime.parse(json["dob"]),
        deviceToken: json["deviceToken"],
        s3Credentials: json["s3Credentials"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "token": token,
        "dob": dob.toIso8601String(),
        "deviceToken": deviceToken,
        "s3Credentials": s3Credentials,
      };
}
