import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxlearn/app/auth/presentation/welcome/welcome_screen.dart';
import 'package:foxlearn/app/root/presentation/root/root_screen.dart';
import 'package:foxlearn/injections/_injections.dart';

import 'auth/presentation/bloc/auth_bloc.dart';
import 'auth/presentation/bloc/bloc.dart';
import 'auth/presentation/sign-in/login_screen.dart';
import 'auth/presentation/sign-up/sign_up_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        bloc: serviceLocator<AuthBloc>()..add(WelcomeEvent()),
        builder: (context, state) {
          return RootScreen();

          if (state is WelcomeEvent) {
            return WelcomeScreen();
          } else if (state is LoginSuccess) {
            return RootScreen();
          } else if (state is SignUpState) {
            return SignUpScreen();
          }
          return LoginScreen();
        });
  }

  _listener(BuildContext context, AuthState authState) {
    if (authState is LoginSuccess) {
      print("isSuccess");
    }
  }

  bool _buildWhen(AuthState preState, AuthState nextState) {
    final bool shouldRebuild = (preState is LoginSuccess && nextState is LoggedOutState) ||
        (preState is SignUpState && nextState is LoggedOutState) ||
        (preState is CheckingAuth && nextState is LoggedOutState) ||
        (nextState is LoginSuccess) ||
        (nextState is SignUpState) ||
        (nextState is LoggedOutState);
    return shouldRebuild;
  }
}
