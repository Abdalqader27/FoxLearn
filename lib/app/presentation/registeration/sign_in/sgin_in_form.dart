import 'package:flutter/material.dart';
import 'package:foxlearn/common/widgets/auth_text_filed.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10..h),
            Text(
              AppString.Phone,
              textAlign: TextAlign.right,
              style: AppTextStyles.medium(),
            ),
            SizedBox(height: 2.0.h),
            AuthTextFormFiled(
                controller: widget.phoneController,
                focusNode: widget.phoneNode,
                svgPath: Assets.svgCall,
                maxLength: 10,
                inputType: TextInputType.number,
                inputAction: TextInputAction.next,
                onTap: () => _resetForm(),
                onSubmit: (_) => _unFocus(context),
                validator: _lengthValidate),
            SizedBox(height: 2.6.h),
            Text(
              Assets.svgLock,
              textAlign: TextAlign.right,
              style: AppTextStyles.medium(),
            ),
            SizedBox(height: 2.0.h),
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
            SizedBox(height: 1..h)
          ],
        ),
      ),
    );
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
}
