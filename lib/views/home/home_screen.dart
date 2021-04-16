import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/libs/vertical_pageview/vertical_card_pager.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:foxlearn/tools/widgets/primary_background.dart';
import 'package:foxlearn/tools/widgets/rounded_text_field.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "اﻷتومات المنتهي الحتمي  ",
      "DFA",
      "NFA To DFA",
    ];

    final List<Widget> images = [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: AppColors.primaryColor,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SvgPicture.asset(
              "assets/svg/Foxlearn.svg",
              fit: BoxFit.none,
              width: double.maxFinite,
            ),
            Container(
              color: AppColors.kLightGrey.withOpacity(.3),
            )
          ],
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: AppColors.primaryColor,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SvgPicture.asset(
              "assets/svg/Foxlearn.svg",
              fit: BoxFit.none,
              width: double.maxFinite,
            ),
            Container(
              color: AppColors.kLightGrey.withOpacity(.3),
            )
          ],
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: AppColors.primaryColor,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SvgPicture.asset(
              "assets/svg/Foxlearn.svg",
              fit: BoxFit.none,
              width: double.maxFinite,
            ),
            Container(
              color: AppColors.kLightGrey.withOpacity(.3),
            )
          ],
        ),
      ),
    ];
    return Scaffold(
      body: PrimaryBackground(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(child: Container()),
              Flexible(
                flex: 9,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: VerticalCardPager(
                    textStyle: TextStyle(
                        color: AppColors.Black15, fontWeight: FontWeight.bold),
                    titles: titles,
                    images: images,
                    onPageChanged: (page) {},
                    align: ALIGN.RIGHT,
                    onSelectedItem: (index) {},
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Text("dad"),
                    Text("ada"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
