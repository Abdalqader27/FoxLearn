import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foxlearn/app/presentation/home/widget/courses_banks/tab_bar_view.dart';
import 'package:foxlearn/app/presentation/services/service1/service1_screen.dart';
import 'package:foxlearn/app/presentation/services/service3/service3_screen.dart';
import 'package:foxlearn/app/presentation/services/service4/service4_screen.dart';
import 'package:foxlearn/app/presentation/services/services2/service2_screen.dart';
import 'package:get/get.dart';

import 'home_implement.dart';

/// Creation by Abd Alqader Alnajjar at 2021 / 5 / 9  -> : )
///
/// Your Life is Short  Do Not Make It  Shorter
///
class HomeScreen extends StatelessWidget with HomeImplements {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(id: 2);
        return false;
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          imageTitle(),

          Card(
            elevation: 0,
            child: ListTile(
              onTap: (){
                Get.to(()=>ServicesOneScreen());
              },
              title: Text("الخدمة الاولى"),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              onTap: (){
                Get.to(()=>Service2Screen());
              },
              title: Text("الخدمة الثانية"),
            ),
          ),       Card(
            elevation: 0,
            child: ListTile(
              onTap: (){
                Get.to(()=>Service3Screen());
              },
              title: Text("الخدمة الثالثة"),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              onTap: (){
                Get.to(()=>Service4Screen());
              },
              title: Text("الخدمة الرابعة"),
            ),
          ),
          /// tab bar between the repeater (courses ) and banks -----------------------
          TabBarViewCoursesBanks(),

          /// container between Banks  and Repeater ( Courses ) -----------------------
          /// you can use bloc or provider it does not matter
          /// i want to use bloc -> ()

          // BlocBuilder<HomeBloc, HomeState>(
          //   bloc: serviceLocator<HomeBloc>(),
          //   builder: (context, state) {
          //     return Container(child: state.widget);
          //   },
          // ),

          /// wow !!!! the class has end ----------------------------------------------------------
        ],
      ),
    );
  }
}
