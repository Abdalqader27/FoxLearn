import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final String? username;
  final String? password;
  final String? phoneNumber;
  final String? email;
  UserCredentials({this.email, this.password, this.username, this.phoneNumber});
  @override
  List<Object?> get props =>
      [this.phoneNumber, this.username, this.password, this.email];
}
