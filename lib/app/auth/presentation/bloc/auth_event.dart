import 'package:foxlearn/app/auth/infrastructure/models/user_crendentials_model.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final UserCredentialsModel userCredentials;
  final bool? rememberLogin;

  const LoginEvent({required this.userCredentials, this.rememberLogin});
}

class WelcomeEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final UserModel user;

  SignUpEvent({required this.user});
}

class IncrementEvent extends AuthEvent {
  final int index;

  IncrementEvent(this.index);
}

class DecrementEvent extends AuthEvent {
  final int index;

  DecrementEvent(this.index);
}
