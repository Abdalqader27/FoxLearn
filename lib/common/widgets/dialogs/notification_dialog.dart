import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app-button.dart';

class NotificationDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String textButtonConfirm;
  final Function onConfirm;

  const NotificationDialog(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.textButtonConfirm,
      required this.onConfirm})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.CARD_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderRadiusAll(25.0),
      ),
      elevation: 10,
      child: Container(
          height: 50.0.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: AppTextStyles.title(),
                      ),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Text(
                      subTitle,
                      style: AppTextStyles.medium(),
                    ),
                  ],
                ),
              ),
              AppButton(onPressed: onConfirm, buttonText: textButtonConfirm)
            ],
          ),
          padding: EdgeInsets.all(15.0.sp),
          decoration: BoxDecoration(
            color: AppColors.WHITE,
            border: Border.all(width: 1, color: AppColors.ACCENT),
            borderRadius: AppStyles.borderRadiusAll(25.0),
          )),
    );
  }
}
