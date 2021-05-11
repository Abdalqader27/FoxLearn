import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';

class SignUpStepper extends StatelessWidget {
  final int indexPage;
  final int? countStepper;
  final PageController pageController;

  SignUpStepper({required this.pageController, this.countStepper, required this.indexPage});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 7.0,
            width: 20,
            padding: EdgeInsets.symmetric(vertical: 1.0),
            child: Container(
              height: 7.0,
              width: 13.0,
              decoration: BoxDecoration(
                  color: 0 <= indexPage ? AppColors.RED : AppColors.GREY,
                  borderRadius: BorderRadius.circular((10.0))),
              margin: EdgeInsets.only(right: (10.0)),
            ),
          ),
          Container(
            height: 7.0,
            width: 20,
            padding: EdgeInsets.symmetric(vertical: 1.0),
            child: Container(
              height: 7.0,
              width: 13.0,
              decoration: BoxDecoration(
                  color: 1 <= indexPage ? AppColors.RED : AppColors.GREY,
                  borderRadius: BorderRadius.circular((10.0))),
              margin: EdgeInsets.only(right: (10.0)),
            ),
          )
        ],
      );
}
