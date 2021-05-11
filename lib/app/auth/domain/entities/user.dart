import 'package:equatable/equatable.dart';

class User extends Equatable {
  User(
      {required this.userName,
      required this.gender,
      required this.college,
      required this.email,
      required this.phoneNumber,
      required this.password});

  final String userName;
  final bool gender;
  final String email;
  final int phoneNumber;
  final int college;
  final String password;

  @override
  List<Object> get props => [
        userName,
        gender,
        email,
        phoneNumber,
        password,
        college,
      ];
}
