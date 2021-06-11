import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/services/service1/automate_input_model.dart';
import 'package:foxlearn/app/presentation/services/service1/service1_details.dart';
import 'package:foxlearn/app/presentation/services/service3/service3_details.dart';
import 'package:foxlearn/app/presentation/services/service3/service3_implement.dart';
import 'package:foxlearn/common/utils/logs.dart';
import 'package:foxlearn/common/widgets/background/primary_background.dart';
import 'package:foxlearn/app/presentation/widgets/rounded_button.dart';
import 'package:foxlearn/common/widgets/background/second_background.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Service3Screen extends StatefulWidget {
  const Service3Screen({Key? key}) : super(key: key);

  @override
  _Service3ScreenState createState() => _Service3ScreenState();
}

class _Service3ScreenState extends State<Service3Screen>
    with Service3Implement {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      alphabetController.add(TextEditingController(
        text: "eps"
      ));
      fieldAlphabet.add(TextField(
        readOnly: true,
        onChanged: (data) {
          setState(() {});
        },
        controller:
        alphabetController[alphabetController.length - 1],
      ));
      addColumn(setState);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SecondBackground(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(
              height: 5.0.h,
            ),
            Card(
              color: AppColors.WHITE.withOpacity(.8),
              elevation: 0,
              shape: AppStyles.cardStyle4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    "من اللاحتمي مع اوبسلن  إلى الحتمي ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle:
                      Text("للتحويل من اﻷتومات اللاحتمي مع اوبسلن إلى أتومات حتمي "),
                ),
              ),
            ),
            rowCard(
              onTap1: () {
                statesController.add(TextEditingController());

                filedStates.add(TextField(
                  onChanged: (data) {
                    setState(() {});
                  },
                  controller: statesController[statesController.length - 1],
                ));
                addRows(setState);
              },
              onTap2: () {
                setState(() {
                  alphabetController.add(TextEditingController());
                  fieldAlphabet.add(TextField(
                    onChanged: (data) {
                      setState(() {});
                    },
                    controller:
                        alphabetController[alphabetController.length - 1],
                  ));
                  addColumn(setState);
                });
              },
              title1: "الحالات",
              title2: "الابجدية",
              children1: filedStates,
              children2: fieldAlphabet,
            ),
            Card(
                elevation: 0,
                color: AppColors.WHITE.withOpacity(.8),
                shape: AppStyles.cardStyle4,
                child: transitFun(context, setState)),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: AppColors.WHITE.withOpacity(.8),
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      onTap: () {
                        selectFirstState(context, setState);
                      },
                      title: Text(
                        "الحالة الابتدائية ",
                        style: TextStyle(fontSize: 11.0.sp),
                      ),
                      subtitle: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "q0 =$firstText ",
                              style: TextStyle(
                                  fontSize: 11.0.sp, letterSpacing: 1.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      onTap: () {
                        selectEndState(context, setState);
                      },
                      title: Text(
                        "الحالات النهائية ",
                        style: TextStyle(fontSize: 11.0.sp),
                      ),
                      subtitle: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "F =$endText ",
                              style: TextStyle(
                                  fontSize: 11.0.sp, letterSpacing: 1.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            theQuintuple(),
            RoundedButton(
              onTap: () {
                AutomateInput automate = AutomateInput(
                    segma: [], q: [], start: '', delta: [], end: []);

                for (int i = 0; i < statesController.length; ++i)
                  automate.q.add(statesController[i].text.toString());
                Logs.logger.i("q= " + automate.q.toString());

// ------------------------------------------------------------------------------------------------------------
                for (int i = 0; i < alphabetController.length; ++i)
                  automate.segma.add(alphabetController[i].text.toString());
                Logs.logger.i("segma= " + automate.segma.toString());
// ------------------------------------------------------------------------------------------------------------

                automate.start = firstText.first.toString();
                Logs.logger.i("start= " + automate.start.toString());

// ------------------------------------------------------------------------------------------------------------
                endText.forEach((element) {
                  automate.end.add(element);
                });
                Logs.logger.i("end= " + automate.end.toString());

                List<List<int>> rows = [];
                for (int i = 0; i < statesController.length; ++i) {
                  rows.add([]);
                  for (int j = 0; j < alphabetController.length; ++j) {
                    Set<int> data = tableController[i][j].item1;
                    int sum = 0;
                    data.forEach((element) {
                      sum += 1 << element;
                    });
                    rows[i].add(sum);
                  }
                }
                automate.delta = rows;
                Logs.logger.i("delta= " + rows.toString());

                Get.to(() => Service3Details(
                      automate: automate,
                    ));
              },
              color: AppColors.LIGHT_Red,
              myChild: Text(
                "تحويل الاتومات إلى حتمي  ",
                style: TextStyle(
                    color: AppColors.WHITE, fontWeight: FontWeight.bold),
              ),
              borderColor: AppColors.LIGHT_Red,
            ),
          ],
        ),
      ),
    );
  }

  Widget rowCard({
    required String title1,
    required String title2,
    required VoidCallback onTap1,
    required VoidCallback onTap2,
    required List<Widget> children1,
    required List<Widget> children2,
  }) {
    return Row(
      children: [
        item(children: children1, onTap: onTap1, title: title1),
        item(children: children2, onTap: onTap2, title: title2),
      ],
    );
  }

  Widget item(
      {required String title,
      required VoidCallback onTap,
      required List<Widget> children}) {
    return Expanded(
      child: Card(
        elevation: 0,
        color: AppColors.WHITE.withOpacity(.8),
        shape: AppStyles.cardStyle4,
        child: ListTile(
          title: ListTile(
            title: Text(
              title,
            ),
            subtitle: IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.add_circle_outline,
                )),
          ),
          subtitle: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
