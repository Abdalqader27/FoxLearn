import 'package:foxlearn/app/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required String userName,
      required bool gender,
      required int college,
      required String email,
      required int phoneNumber,
      required String password})
      : super(
            password: password,
            userName: userName,
            gender: gender,
            email: email,
            phoneNumber: phoneNumber,
            college: college);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      gender: json['gender'],
      college: json['college'],
      email: json['email'],
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'college': college,
      'phoneNumber': phoneNumber,
      'password': password,
      'email': email,
      'gender': gender
    };
  }
}
