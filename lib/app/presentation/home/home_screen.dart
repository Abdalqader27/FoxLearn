import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/presentation/home/widget/courses_banks/tab_bar_view.dart';
import 'package:foxlearn/app/presentation/services/service1/service1_screen.dart';
import 'package:foxlearn/app/presentation/services/service3/service3_screen.dart';
import 'package:foxlearn/app/presentation/services/service4/service4_screen.dart';
import 'package:foxlearn/app/presentation/services/services2/service2_screen.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      child: Column(
        children: [
          // Card(
          //   elevation: 0,
          //   child: ListTile(
          //     onTap: () {
          //       Get.to(() => ServicesOneScreen());
          //     },
          //     title: Text("الخدمة الاولى"),
          //   ),
          // ),
          // Card(
          //   elevation: 0,
          //   child: ListTile(
          //     onTap: () {
          //       Get.to(() => Service2Screen());
          //     },
          //     title: Text("الخدمة الثانية"),
          //   ),
          // ),
          // Card(
          //   elevation: 0,
          //   child: ListTile(
          //     onTap: () {
          //       Get.to(() => Service3Screen());
          //     },
          //     title: Text("الخدمة الثالثة"),
          //   ),
          // ),
          // Card(
          //   elevation: 0,
          //   child: ListTile(
          //     onTap: () {
          //       Get.to(() => Service4Screen());
          //     },
          //     title: Text("الخدمة الرابعة"),
          //   ),
          // ),

          /// tab bar between the repeater (courses ) and banks -----------------------
          SvgPicture.asset(Assets.svgFox),
          SvgPicture.asset(Assets.svgFoxlearn),

          /// container between Banks  and Repeater ( Courses ) -----------------------
          /// you can use bloc or provider it does not matter
          /// i want to use bloc -> ()
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: [
              Card(
                  margin: EdgeInsets.all(20),
                  elevation: 0,
                  color: AppColors.LIGHT_Red.withOpacity(.05),
                  shape: AppStyles.cardStyle1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DottedBorder(
                          child: ListTile(
                            title: Text(
                              "لماذا FoxLearn ؟؟",
                              style: AppTextStyles.medium(
                                      fontWeight: FontWeight.bold)
                                  .copyWith(fontSize: 20),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "فوكس ليرن ممتع وفعال. تساعدك دروس المحاكاة والشخصيات الممتعة على بناء مهارات قوية وفهم التمارين والمسائل بسرعة وسلاسة .",
                                softWrap: true,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          radius: Radius.circular(15),
                          strokeWidth: 1,
                          borderType: BorderType.RRect,
                          color: AppColors.LIGHT_Red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DottedBorder(
                          child: ListTile(
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " لقد تم تصميمه من قبل  خبراء من أساتذة ومبرمجين، و لديه منهجية تدريس  قائمة على العلم ثبت أنها تعزز الاحتفاظ بالمعلومة  على المدى الطويل..",
                                softWrap: true,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          radius: Radius.circular(15),
                          strokeWidth: 1,
                          borderType: BorderType.RRect,
                          color: AppColors.LIGHT_Red,
                        ),
                      ],
                    ),
                  ))
            ],
          )),
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
