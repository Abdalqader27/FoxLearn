import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/presentation/files/files_api.dart';
import 'package:foxlearn/app/presentation/services/services_details.dart';
import 'package:foxlearn/app/presentation/tests/subject_model.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ServicesScreen extends StatefulWidget {
  ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

// List<String> title = [
//   " NFA - > DFA",
//   " Eps NFA - > DFA",
//   " Draw Automate",
//   " Dfa - > Reg",
// ];
// List<String> subtitle = [
//   "تحويل من اﻷتومات  المنتهي اللاحتمي إلى أتومات منتهي حتمي ",
//   "تحويل من اﻷتومات  المنتهي اللاحتمي مع أوبسلن إلى أتومات منتهي حتمي ",
//   "رسم اﻷتومات وعرض جدول الأنتقال الخاص به  ",
//   "تحويل من اﻷتومات  المنتهي الحتمي  إلى تعبير منتظم  ",
// ];

class _ServicesScreenState extends State<ServicesScreen> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Opacity(
                opacity: .1,
                child: Center(child: SvgPicture.asset(Assets.svgFox))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FutureBuilder<List<SubjectsModel>>(
                    future: FilesApi().getSubjects(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) return LottieLoading();
                      return ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: snapshot.data!
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Card(
                                    elevation: 0,
                                    color: AppColors.White.withOpacity(.9),
                                    shape: AppStyles.cardStyle1,
                                    child: ListTile(
                                      onTap: () {
                                        Get.to(() => ServiceDetails(e.id));
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          '${e.name}',
                                          style: AppTextStyles.title(),
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('${e.description}'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList());
                    }),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(14.0),
            //   child: Card(
            //     color: AppColors.White.withOpacity(.3),
            //     elevation: 0,
            //     shape: AppStyles.cardStyle4,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text("حدد المادة لتصفح الخدمات المتوفرة لها "),
            //     ),
            //   ),
            // ),
          ],
        ),

        // body: SingleChildScrollView(
        //   child: Column(
        //     children: <Widget>[
        //       // Directionality(
        //       //   textDirection: TextDirection.ltr,
        //       //   child: Stack(
        //       //     children: <Widget>[
        //       //       CardScrollWidget(currentPage),
        //       //       Positioned.fill(
        //       //         child: PageView.builder(
        //       //           itemCount: title.length,
        //       //           controller: controller,
        //       //           reverse: true,
        //       //           itemBuilder: (context, index) {
        //       //             return Container();
        //       //           },
        //       //         ),
        //       //       )
        //       //     ],
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}






