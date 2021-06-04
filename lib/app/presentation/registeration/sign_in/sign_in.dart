import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/controllers/registerations/sign_in_controller.dart';
import 'package:foxlearn/app/infrastructure/models/user_data.dart';
import 'package:foxlearn/app/presentation/registeration/sign_in/sgin_in_form.dart';
import 'package:foxlearn/app/presentation/registeration/sign_up/sign_up.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/get_image.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/neu_button.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/outline_button.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/widgets/text_view.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignIn extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SignInController(Get.find<AppController>()), permanent: true);

    /// Title Section-----------------------------------------
    final helloText = TextView(text: AppString.HELLO);
    final registerText =
        TextView(text: AppString.RegisterToLogin, isTitle: false);
    final image = GetTopImage(path: Assets.svgFox);

    /// Buttons Section ----------------------------------------------------------------------------
    final loginButton = NeuFlatButton(
        onTap: () => controller.onClickOk(), text: AppString.Login);
    final signUptButton = OutlineNeuButton(
        text: AppString.NEW_ACCOUNT, onTap: () => Get.to(() => SignUp()));

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          image,
          helloText,
          registerText,
          SizedBox(height: 3.0.h),
          controller.obx(
              ((state) =>
                  _loginSection(loginButton, signUptButton, controller)),
              onLoading: LottieLoading()),
        ],
      ),
    );
  }
}

Widget _loginSection(enterButton, newAccountButton, controller) {
  return Column(
    children: [
      SignForm(
        formKey: controller.formKey,
        passwordNode: controller.focusNodePassword,
        passwordController: controller.passwordController,
        phoneController: controller.phoneController,
        phoneNode: controller.focusNodePhone,
      ),
      SizedBox(
        height: 2.0.h,
      ),
      enterButton,
      SizedBox(height: 2.0.h),
      newAccountButton,
      SizedBox(height: 3.0.h),
    ],
  );
}

storeDefaultLogin() {
  GetStorage().write(AppKeys.LOGIN_FLAG_KEY, false);
  UserAccount user = UserAccount(
    id: 0,
    dob: DateTime.now(),
    email: "",
    lastName: "",
    firstName: "",
    password: "",
    phoneNumber: "",
  );
  GetStorage().write(AppKeys.USER_FLAG_KEY, json.encode(user.toJson()));
}
