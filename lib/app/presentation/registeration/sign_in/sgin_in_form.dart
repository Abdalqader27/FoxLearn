import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/registerations/sign_in_controller.dart';
import 'package:foxlearn/common/widgets/auth_text_filed.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class SignForm extends StatefulWidget {
  final TextEditingController? phoneController;
  final TextEditingController? passwordController;
  final FocusNode? phoneNode;
  final FocusNode? passwordNode;
  final GlobalKey<FormState>? formKey;

  SignForm({
    Key? key,
    this.phoneController,
    this.passwordController,
    this.formKey,
    this.phoneNode,
    this.passwordNode,
  }) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  RxBool indicator = false.obs;

  Icon iconPassword = Icon(
    Icons.visibility_off,
    color: AppColors.grey,
    size: 14.0.sp,
  );
  bool see = true;

  onEye() {
    setState(() {
      if (see) {
        iconPassword = Icon(
          Icons.visibility,
          color: AppColors.thirdColor,
          size: 14.0.sp,
        );
        see = false;
      } else {
        see = true;
        iconPassword = Icon(
          Icons.visibility_off,
          color: AppColors.grey,
          size: 14.0.sp,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Form(
          key: widget.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10..h),
                Visibility(
                  visible: !indicator.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                        child: Text(
                          'اسم المستخدم / اﻹيميل',
                          textAlign: TextAlign.right,
                          style: AppTextStyles.medium(),
                        ),
                      ),
                      SizedBox(height: 1.0.h),
                      AuthTextFormFiled(
                          controller: widget.phoneController,
                          focusNode: widget.phoneNode,
                          svgPath: Assets.svgProfile,
                          maxLength: 10,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          onTap: () => _resetForm(),
                          onSubmit: (_) => _unFocus(context),
                          validator: _lengthValidate),
                    ],
                  ),
                ),
                //   SizedBox(height: 2.6.h),

                Visibility(
                  visible: indicator.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                        child: Text(
                          'كلمة السر ',
                          textAlign: TextAlign.right,
                          style: AppTextStyles.medium(),
                        ),
                      ),
                      SizedBox(height: 1.0.h),
                      AuthTextFormFiled(
                          suffixIcon: GestureDetector(
                            child: iconPassword,
                            onTap: onEye,
                          ),
                          controller: widget.passwordController,
                          focusNode: widget.passwordNode,
                          svgPath: Assets.svgLock,
                          obscure: see,
                          inputAction: TextInputAction.send,
                          onTap: () => _resetForm(),
                          onSubmit: (_) {},
                          validator: _lengthValidate),
                    ],
                  ),
                ),
                SizedBox(height: 2.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    startButton(context, () {
                      if (widget.formKey!.currentState!.validate()) {
                        if (indicator.isTrue) {
                          Get.find<SignInController>().onClickOk();
                        }
                        indicator(true);
                      }
                    }, indicator.isTrue ? "الدخول" : "التالي"),
                    SizedBox(
                      width: 3.0.w,
                    ),
                    Visibility(
                        visible: indicator.value,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          child: backButton(
                              context, () => {indicator(false)}, "الرجوع"),
                        )),
                  ],
                ),
                SizedBox(height: 2.0.h),
              ],
            ),
          ),
        ));
  }

  _resetForm() {
    // formKey.currentState.reset();
  }

  _unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(widget.passwordNode);
  }

  String? _lengthValidate(String? value) {
    if (value?.trim().length == 0) return AppString.INPUT_ERROR;
    return null;
  }

  Widget startButton(context, click, text) => Center(
        child: TextButton.icon(
            // onPressed: () => Get.to(() => SignInScreen()),
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_back_ios),
            ),
            label: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child:
                    Text(text, style: TextStyle(fontWeight: FontWeight.bold))),
            style: TextButton.styleFrom(
                elevation: 0,
                enableFeedback: true,
                primary: AppColors.Black15,
                animationDuration: Duration(milliseconds: 1000),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: AppColors.primaryColor),
            onPressed: click),
      );

  Widget backButton(context, click, text) => Center(
        child: TextButton.icon(
            // onPressed: () => Get.to(() => SignInScreen()),
            label: Container(),
            icon: Icon(Icons.arrow_forward_ios_outlined),
            style: TextButton.styleFrom(
                elevation: 0,
                enableFeedback: true,
                primary: AppColors.Black15,
                animationDuration: Duration(milliseconds: 1000),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: AppColors.primaryColor),
            onPressed: click),
      );
}
