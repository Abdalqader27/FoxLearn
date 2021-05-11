import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/common/app_router/pages.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroStepper extends StatelessWidget {
  final int indexPage;
  final int countStepper;
  final PageController pageController;

  IntroStepper({required this.pageController, required this.countStepper, required this.indexPage});

  @override
  Widget build(BuildContext context) => Container(
        width: 90,
        height: 90,
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 90,
                height: 90,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(AppColors.LIGHT_Red),
                  value: (indexPage + 1) / (countStepper + 1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: BouncingWidget(
                duration: Duration(milliseconds: 100),
                scaleFactor: 1.5,
                onPressed: () async {
                  if (indexPage < countStepper)
                    pageController.animateToPage(indexPage + 1,
                        duration: Duration(microseconds: 500), curve: Curves.easeIn);
                  if (indexPage == 2) {
                    await GetStorage().write(AppKeys.INTRO_FLAG, true);
                    Get.offNamed(AppRoutes.APP);
                  }
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: AppColors.LIGHT_Red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
