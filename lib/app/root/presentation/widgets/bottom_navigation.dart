import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'bottom_nav_bar_painter.dart';

class AppBottomNavigation extends StatelessWidget {
  final state;
  final onTabBottomNavigation;

  const AppBottomNavigation({Key? key, this.state, this.onTabBottomNavigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavBarV2(
          state: state,
          onTabBottomNavigation: onTabBottomNavigation,
        ));
  }
}

class BottomNavBarV2 extends StatelessWidget {
  final GlobalKey bottomNavigationKey = GlobalKey();
  final onTabBottomNavigation;
  final state;

  BottomNavBarV2({Key? key, this.onTabBottomNavigation, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      width: size.width,
      height: 7.0.h,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          CustomPaint(
            size: Size(size.width, 10.0.h),
            painter: BottomNavBarPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [AppStyles.darkBoxShadow],
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Material(
                  color: AppColors.ACCENT,
                  elevation: 10, // button color
                  child: InkWell(
                    highlightColor: Color(0xfffdc66c),
                    splashColor: Color(0xfffdc66c), // inkwell color
                    child: SizedBox(
                        width: 14.0.w, child: Center(child: SvgPicture.asset(Assets.svgHome))),
                    onTap: () => onTabBottomNavigation(1),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 10.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => onTabBottomNavigation(0),
                  child: SvgPicture.asset(
                    Assets.svgNotification,
                    color: state.indexPage == 0 ? AppColors.ACCENT : AppColors.WHITE,
                  ),
                ),
                Container(
                  width: size.width * 0.20,
                ),
                GestureDetector(
                  onTap: () => onTabBottomNavigation(2),
                  child: SvgPicture.asset(
                    Assets.svgEditSquare,
                    color: state.indexPage == 2 ? AppColors.ACCENT : AppColors.WHITE,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppCurvedBottomNavigation extends StatelessWidget {
  final state;
  final onTabBottomNavigation;

  const AppCurvedBottomNavigation({this.state, this.onTabBottomNavigation});

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
        iconSize: 25.0,
        selectedColor: AppColors.LIGHT_Red,
        strokeColor: AppColors.LIGHT_Red,
        elevation: 0,
        blurEffect: true,
        isFloating: true,
        borderRadius: Radius.circular(15),
        scaleFactor: .5,
        unSelectedColor: Colors.grey[400],
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icon(FontAwesome5.home),
          ),
          CustomNavigationBarItem(
            icon: Icon(FontAwesome.folder_open),
          ),
          CustomNavigationBarItem(
            icon: Icon(FontAwesome.menu),
          ),
          CustomNavigationBarItem(
            icon: Icon(FontAwesome.book),
          ),
          CustomNavigationBarItem(
            icon: Icon(FontAwesome.chart_bar),
          ),
          CustomNavigationBarItem(
            icon: Icon(FontAwesome.user),
          ),
        ],
        currentIndex: state.indexPage,
        onTap: onTabBottomNavigation);
  }
}
