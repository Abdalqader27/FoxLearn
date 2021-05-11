import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxlearn/app/auth/application/login_facade_service.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_event.dart';
import 'package:foxlearn/app/auth/presentation/bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginFacadeService loginFacadeService;

  AuthBloc(AuthState initialState, this.loginFacadeService) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield* _tryLogin(event);
    } else if (event is CheckAuthEvent) {
      yield* _checkAuth();
    } else if (event is LogoutEvent) {
      await loginFacadeService.logOut();
      yield LoggedOutState();
    } else if (event is IncrementEvent) {
      yield IndicatorState(index: event.index);
    } else if (event is DecrementEvent) {
      yield IndicatorState(index: event.index);
    } else if (event is SignUpEvent)
      yield SignUpState();
    else if (event is WelcomeEvent) yield WelcomeState();
  }

  Stream<AuthState> _checkAuth() async* {
    final bool? login = loginFacadeService.getLoginFlag();
    if (login == null || !login) {
      yield LoggedOutState();
    } else
      yield LoginSuccess(

          ///get user from local
          user: loginFacadeService.getUser());
  }

  Stream<AuthState> _tryLogin(LoginEvent event) async* {
    yield LoadingState(message: 'جاري الاتصال بالخادم..');
    UserModel? result = await loginFacadeService.signIn(event.userCredentials, event.rememberLogin);
    if (result != null) {
      yield LoginSuccess(user: result);
    }
    // else yield LoginError(networkExceptions: networkExceptions)
  }
}
