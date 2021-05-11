import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/root/presentation/home/home_bloc/home_bloc.dart';
import 'package:foxlearn/app/root/presentation/home/home_bloc/home_event.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/fonts.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'banks/banks_container.dart';
import 'courses/courses_container.dart';
import 'custom_tab_indicator.dart';

class TabBarViewCoursesBanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.5.h,
      margin: EdgeInsets.only(top: 2.0.h),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: TabBar(
            labelPadding: EdgeInsets.all(0),
            indicatorPadding: EdgeInsets.all(0),
            isScrollable: true,
            onTap: (index) {
              serviceLocator<HomeBloc>().add(
                ChangeWidgetTab(
                  index == 0 ? CoursesContainer() : BanksContainer(),
                ),
              );
            },
            labelColor: AppColors.LIGHT_BLACK,
            unselectedLabelColor: AppColors.DARK_GREY,
            labelStyle: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.sstArabicFont,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.sstArabicFont,
            ),

            /// change indicator  style-----------------------------------------
            indicator: RoundedRectangleTabIndicator(
              weight: 3,
              width: 3.5.w,
              color: AppColors.LIGHT_BLACK,
            ),

            /// tabs items -----------------------------------------------------------
            tabs: [
              _tab(AppString.COURSES),
              _tab(AppString.BANKS),
            ]),
      ),
    );
  }

  Tab _tab(name) {
    return Tab(
      child: Container(
        margin: EdgeInsets.only(right: 7.0.w),
        child: Text(AppString.COURSES),
      ),
    );
  }
}
