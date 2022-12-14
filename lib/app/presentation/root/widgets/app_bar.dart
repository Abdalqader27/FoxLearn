import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/common/widgets/circle_button.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppAppBar extends StatelessWidget {
  final int pageIndex;
  final VoidCallback onTapDrawer;
  AppAppBar({Key? key, required this.pageIndex, required this.onTapDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0.h),
      child: Row(
        children: [
          // CircleButton(
          //   onTap: onTapDrawer,
          //   icon: Assets.svgMenu,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title[pageIndex],
              style: AppTextStyles.title().copyWith(color: AppColors.WHITE),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: AppColors.WHITE,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              onPressed: () async {
                Get.find<AppController>().logout();
              },
              child: Text("تسجيل الخروج ",style: TextStyle(color: AppColors.LIGHT_Red),)),

          // CircleButton(
          //   onTap: () {},
          //   icon: Assets.svgSearch,
          // )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  final List<String> title = ["الرئيسية ", "الملفات", "الخدمات", "اﻹختبارات","أماكن البيع ", "الملاحظات"];
}
