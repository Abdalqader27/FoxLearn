import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/presentation/home/widget/courses_banks/custom_tab_indicator.dart';
import 'package:foxlearn/app/presentation/user/tabs_screen/activity_screen.dart';
import 'package:foxlearn/app/presentation/user/tabs_screen/note_screen.dart';
import 'package:foxlearn/app/presentation/user/tabs_screen/selected_material_screen.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserScreenImplement {
  Widget titleImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(child: SvgPicture.asset('assets/svg/fox.svg', height: 40.0.w)),
        Flexible(
          child: Card(
            margin: EdgeInsets.all(20),
            elevation: 0,
            shape: AppStyles.cardStyle1,
            child: ListTile(
              title: Text("مرحبا بك ", style: AppTextStyles.medium(fontWeight: FontWeight.bold)),
              subtitle: Text("سعيدون بك يمكنك اﻹطلاع على انجازتك ونشاطاتك"),
            ),
          ),
        ),
      ],
    );
  }

  Widget tabBar(context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 7.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.grey.withOpacity(.01),
        ),
        child: _tabView());
  }

  Widget _tabView() {
    return TabBar(
        indicatorWeight: 3.0,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: AppColors.LIGHT_Red,
        indicatorPadding: EdgeInsets.all(8.0),
        indicator: RoundedRectangleTabIndicator(color: AppColors.LIGHT_Red, width: 30, weight: 3),
        tabs: _tabs(["المواد المختارة", "النشاطات", "الملاحظات"]));
  }

  List<Widget> _tabs(List<String> title) {
    return List.generate(
      title.length,
      (i) => Text(
        title[i],
        style: AppTextStyles.medium().copyWith(color: AppColors.kDark),
      ),
    );
  }

  Widget tabBarView(animationController) {
    return TabBarView(children: [
      SelectedMaterialScreen(animationController: animationController),
      ActivityScreen(),
      NoteScreen()
    ]);
  }
}
