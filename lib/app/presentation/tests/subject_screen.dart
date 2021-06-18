import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/home/widget/courses_banks/custom_tab_indicator.dart';
import 'package:foxlearn/app/presentation/tests/quiz_screen.dart';
import 'package:foxlearn/app/presentation/tests/subject_model.dart';
import 'package:foxlearn/app/presentation/tests/test_api.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(top: 5.0.h, right: 5.0.w, left: 5.0.w),
        child: FutureBuilder<List<SubjectsModel>>(
            future: TestsApi().getSubjects(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return LottieLoading();
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  final current = snapshot.data![i];
                  return BouncingWidget(
                    duration: Duration(milliseconds: 500),
                    scaleFactor: 2.5,
                    onPressed: () {
                      Get.to(() => QuizScreen(
                            id: current.id,
                          ));
                      //   Get.to(() => TestDetails(id: current.id));
                    },
                    child: Card(
                      color: AppColors.WHITE.withOpacity(.99),
                      elevation: 0,
                      shape: AppStyles.cardStyle4,
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(current.name),
                        subtitle: Text(current.description),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
