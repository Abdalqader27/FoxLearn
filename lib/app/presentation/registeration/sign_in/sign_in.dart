import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/controllers/registerations/sign_in_controller.dart';
import 'package:foxlearn/app/presentation/registeration/sign_in/sgin_in_form.dart';
import 'package:foxlearn/app/presentation/registeration/sign_in/widgets/welcome_background_image.dart';
import 'package:foxlearn/app/presentation/registeration/sign_in/widgets/welcome_title.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:get/get.dart';

class SignIn extends GetView<SignInController>
    with BackgroundImage, WelcomeTitle {
  @override
  Widget build(BuildContext context) {
    Get.put(SignInController(Get.find<AppController>()), permanent: true);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          KeyboardVisibilityBuilder(
            builder: (context, visible) {
              if (!visible) return welcomeTitle();
              else return Container();
            },
          ),
          imageBackground(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: controller.obx(((state) => _loginSection(controller)),
                onLoading: LottieLoading()),
          ),
        ],
      ),
    );
  }
}

Widget _loginSection(controller) {
  return Column(
    children: [
      SignForm(
        formKey: controller.formKey,
        passwordNode: controller.focusNodePassword,
        passwordController: controller.passwordController,
        phoneController: controller.phoneController,
        phoneNode: controller.focusNodePhone,
      ),
    ],
  );
}

// storeDefaultLogin() {
//   GetStorage().write(AppKeys.LOGIN_FLAG_KEY, false);
//   UserAccount user = UserAccount(
//     id: 0,
//     dob: DateTime.now(),
//     email: "",
//     lastName: "",
//     firstName: "",
//     password: "",
//     phoneNumber: "",
//   );
//   GetStorage().write(AppKeys.USER_FLAG_KEY, json.encode(user.toJson()));
// }
