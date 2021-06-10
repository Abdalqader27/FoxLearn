import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foxlearn/app/presentation/home/widget/courses_banks/tab_bar_view.dart';
import 'package:foxlearn/app/presentation/services/service1/service1_screen.dart';
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
          // CustomPaint(
          //     size: Size(MediaQuery.of(context).size.width, 0),
          //
          //     /// for background with common session ------------------------
          //     painter: HomeBackgroundCustomPainter(),
          //     child: Column(children: [
          //       SizedBox(height: 3.0.h),
          //
          //       /// get common session title --------------------------------------
          //       //  commonSessionTitle(),
          //
          //       /// Sections 1- for
          //       /// get the common
          //       /// session -----------------------------------------------------------------
          //       // Container(
          //       //     height: 30.0.h,
          //       //     child: ListView.builder(
          //       //         itemCount: 5,
          //       //         shrinkWrap: true,
          //       //         scrollDirection: Axis.horizontal,
          //       //         itemBuilder: (_, index) {
          //       //           return CommonSessionItem(
          //       //             university: "كلية الطب البشري جامعة حلب ",
          //       //             category: "السنة الرابعة الفصل الثاني ",
          //       //             count: 10,
          //       //             date: "2021 - 10 - 10",
          //       //             onTap: () {},
          //       //           );
          //       //         }))
          //     ])),

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
