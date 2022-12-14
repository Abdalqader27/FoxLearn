import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/registerations/signUp_controller.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/neu_button.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/sign_up_section.dart';
import 'package:foxlearn/common/widgets/app_bar.dart';
import 'package:foxlearn/common/widgets/custom_flat_button.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUp extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SignUpController>(() => SignUpController());

    /// Title Section-----------------------------------------
    final appbar =
        AppBarUser(text: AppString.CreateAccount, color: AppColors.LIGHT_Red);

    /// Buttons Section ----------------------------------------------------------------------------

    return Scaffold(
      backgroundColor: AppColors.GrayLightColor,
      key: controller.scaffoldKey,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              appbar,
              Expanded(
                child: controller.obx(
                    ((state) => SignUpSection(
                          enterButton: CustomFlatButton(
                              onTap: controller.onClickOk,
                              title: AppString.CreateAccount),
                          controller: controller,
                        )),
                    onLoading: Center(
                        child: Lottie.asset(Assets.lottiLoading,
                            width: 200..w, height: 200..h))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
