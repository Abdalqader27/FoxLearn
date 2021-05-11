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
    return BlocProvider<AuthBloc>(
      create: (context) => serviceLocator<AuthBloc>()..add(WelcomeEvent()),
      child: BlocConsumer<AuthBloc, AuthState>(
          buildWhen: _buildWhen,
          listenWhen: _buildWhen,
          listener: _listener,
          builder: (context, state) {
            if (state is CheckAuthEvent) {
              return LoginScreen();
            } else if (state is LoginSuccess) {
              return RootScreen();
            } else if (state is SignUpState) {
              return SignUpScreen();
            }
            return WelcomeScreen();
          }),
    );
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
