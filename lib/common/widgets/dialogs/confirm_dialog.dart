import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app-button.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String textButtonConfirm;
  final Function onCallConfirm;
  final onCancel;

  const ConfirmDialog(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.textButtonConfirm,
      required this.onCallConfirm,
      required this.onCancel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.CARD_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderRadiusT,
      ),
      elevation: 10,
      child: Container(
        height: 32.0.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 5.0.w),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.PRIMARY,
                boxShadow: [AppStyles.darkBoxShadow],
                borderRadius: AppStyles.borderRadiusT,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.title().copyWith(color: AppColors.WHITE),
                  ),
                  IconButton(
                      color: AppColors.WHITE,
                      icon: Icon(Icons.cancel_outlined),
                      onPressed: onCancel)
                ],
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Expanded(
              child: Center(
                child: Text(
                  subTitle,
                  style: AppTextStyles.medium().copyWith(color: AppColors.LIGHT_BLACK),
                ),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    onPressed: onCallConfirm,
                    buttonText: textButtonConfirm,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
