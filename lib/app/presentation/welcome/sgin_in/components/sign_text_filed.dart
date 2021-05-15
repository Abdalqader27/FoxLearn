import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/welcome/sgin_in/sign_editing_controller.dart';
import 'package:foxlearn/app/presentation/widgets/rounded_text_field.dart';
import 'package:foxlearn/resources/theme/colors.dart';

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
          index: 0,
          onTapIcon: () {},
        ),
        RoundedTextField(
          iconVisibility: true,
          onTapIcon: _textFieldSignIn.changeVisibilityOfPassword,
          controller: _textFieldSignIn.passwordController,
          onTyping: (){},
          obscureText: true,
          icon: Icon(Icons.visibility),
          textInputType: TextInputType.number,
          hint: 'Password',
          color: AppColors.White,
          borderColor: AppColors.White,
          index: 1,
        )
      ];
}
