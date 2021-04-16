import 'package:flutter/material.dart';

class  SignFunctions{
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool changedObscure = false;
  bool visible = false;

  bool validate6chars(String value) {
    visible = (value.length > 6) ? true : false;
    return visible;
  }

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    bool emailValid = regExp.hasMatch(value);
    if (emailValid)
      visible = true;
    else
      visible = false;
    return emailValid;
  }

  bool changeVisibilityOfPassword() {
    changedObscure = !changedObscure;
    return changedObscure;
  }
}
