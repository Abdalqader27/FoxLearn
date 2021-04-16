import 'package:flutter/material.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:foxlearn/tools/widgets/rounded_text_field.dart';
import 'package:foxlearn/views/login/sign_editing_controller.dart';

class TextFieldSignIn {
  final SignFunctions _textFieldSignIn = SignFunctions();

  List<RoundedTextField> textFields() => [
        RoundedTextField(
          iconVisibility: false,
          controller: _textFieldSignIn.emailController,
          onTyping: _textFieldSignIn.validateEmail,
          obscureText: false,
          hint: 'Email Address',
          color: AppColors.White,
          borderColor: AppColors.White,
          icon: Icon(Icons.check, color: Colors.green),
          textInputType: TextInputType.emailAddress,
        ),
        RoundedTextField(
          iconVisibility: true,
          onTapIcon: _textFieldSignIn.changeVisibilityOfPassword,
          controller: _textFieldSignIn.passwordController,
          onTyping: null,
          obscureText: true,
          icon: Icon(Icons.visibility),
          textInputType: TextInputType.number,
          hint: 'Password',
          color: AppColors.White,
          borderColor: AppColors.White,
        )
      ];
}
