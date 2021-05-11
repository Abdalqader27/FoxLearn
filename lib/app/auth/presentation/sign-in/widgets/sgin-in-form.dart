import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_crendentials_model.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_event.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_state.dart';
import 'package:foxlearn/app/auth/presentation/sign-in/widgets/text-field-items.dart';
import 'package:foxlearn/common/widgets/app-button.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'create-account-button.dart';

class SignForm extends HookWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode? _phoneNode = FocusNode();
  final FocusNode? _passwordNode = FocusNode();
  final GlobalKey<FormState>? _formKey = GlobalKey();

  final helloText = Center(
      child: Text(
    AppString.HELLO,
    style: AppTextStyles.medium(fontWeight: FontWeight.bold),
  ));
  final registerText = Center(
      child: Text(
    AppString.PLEASE_LOGIN,
    style: AppTextStyles.medium(fontWeight: FontWeight.w600),
  ));

  @override
  Widget build(BuildContext context) {
    final rememberLogin = useState(true);
    List<Widget> items = getEditTexts(context,
        passwordController: _passwordController,
        passwordNode: _passwordNode,
        phoneController: _nameController,
        phoneNode: _phoneNode,
        rememberLogin: rememberLogin);

    return Form(
      key: _formKey,
      child: BlocBuilder<AuthBloc, AuthState>(
        bloc: serviceLocator<AuthBloc>(),
        builder: (BuildContext context, state) {
          if (state is LoadingState) return Center(child: CircularProgressIndicator());
          return ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.min,
            children: [
              helloText,
              SizedBox(height: 1.0.h),
              registerText,
              SizedBox(height: 4.0.h),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length + 1,
                padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 0.0.w),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return index < items.length
                      ? items[index]
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                          child: AppButton(
                              onPressed: () => onPressedLogin(rememberLogin), buttonText: "تم"),
                        );
                },
              ),
              SizedBox(height: 10.0.h),
              CreateAccountButton(onTap: () => onCreateAccount(context))
            ],
          );
        },
      ),
    );
  }

  onCreateAccount(context) {
    serviceLocator<AuthBloc>()
      ..add(SignUpEvent(
          user: UserModel(
              userName: ',', email: '', college: 1, gender: false, phoneNumber: 13, password: '')));
  }

  onPressedLogin(rememberLogin) async {
    if (_formKey!.currentState!.validate()) {
      serviceLocator<AuthBloc>()
        ..add((LoginEvent(
            userCredentials: UserCredentialsModel(
                phoneNumber: _phoneController.text, password: _passwordController.text),
            rememberLogin: rememberLogin.value)));
    }
  }
}
