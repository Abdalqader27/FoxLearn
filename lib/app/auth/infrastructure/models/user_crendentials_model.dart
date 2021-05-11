import 'package:foxlearn/app/auth/domain/entities/user_credentials.dart';

class UserCredentialsModel extends UserCredentials {
  final String password;
  final String phoneNumber;

  UserCredentialsModel({
    required this.password,
    required this.phoneNumber,
  }) : super(password: password, phoneNumber: phoneNumber);

  toJson() {
    Map<String, dynamic> map = {};
    map['password'] = this.password;
    map['phoneNumber'] = this.phoneNumber;
  }

  @override
  List<Object?> get props => [this.phoneNumber, this.username, this.password];
}
