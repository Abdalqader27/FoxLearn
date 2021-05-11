import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/common/exceptions/network_expcepations/network_exceptions.dart';

abstract class AuthState {
  final int? index;

  const AuthState({this.index = 0});
}

class LoggedOutState extends AuthState {}

class LoadingState extends AuthState {
  final String message;

  const LoadingState({
    required this.message,
  });
}

class WelcomeState extends AuthState {}

class LoginSuccess extends AuthState {
  final UserModel? user;

  const LoginSuccess({required this.user});
}

class SignUpState extends AuthState {}

class CheckingAuth extends AuthState {}

class LoginError extends AuthState {
  final NetworkExceptions networkExceptions;

  const LoginError({required this.networkExceptions});
}

class IndicatorState extends AuthState {
  final int index;

  const IndicatorState({required this.index});
}
