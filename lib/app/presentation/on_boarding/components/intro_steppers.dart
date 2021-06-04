import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/intro_controller.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:get/get.dart';


class IntroStepper extends GetView<IntroController> {
  final PageController pageController;
  final countStepper;

  IntroStepper({required this.pageController, this.countStepper});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            countStepper,
            (int index) => GestureDetector(
                  onTap: () => pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: (25.0)),
                    child: Container(
                      height: (7.0),
                      width: (40.0),
                      decoration: BoxDecoration(
                          color: index <= controller.indexPage ? AppColors.LIGHT_BLACK : AppColors.GREY, borderRadius: BorderRadius.circular((10.0))),
                      margin: EdgeInsets.only(right: (10.0)),
                    ),
                  ),
                )),
      );
}
