import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/services/service1/nfa_dfa_output.dart';
import 'package:foxlearn/app/presentation/services/service1/service1_api.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/app/presentation/widgets/primary_background.dart';
import 'package:foxlearn/common/api_tools/api_result.dart';
import 'package:foxlearn/common/widgets/background/second_background.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:foxlearn/common/widgets/progress_Indicator.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:mdi/mdi.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'automate_input_model.dart';

class Service1Details extends StatefulWidget {
  final AutomateInput automate;

  const Service1Details({Key? key, required this.automate}) : super(key: key);

  @override
  _Service1DetailsState createState() => _Service1DetailsState();
}

class _Service1DetailsState extends State<Service1Details> {
  late Future<NfaDfaModel?> future;

  @override
  void initState() {
    future = Service1Api().nfaToDfa(automate: widget.automate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Api" + widget.automate.toString());
    return Scaffold(
      body: WelcomeBackground(
        child: FutureBuilder<NfaDfaModel?>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.data == null) return LottieLoading();
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  SizedBox(height: 20.0.h),
                  Card(
                    color: AppColors.kLightGrey.withOpacity(.8),
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          "نتائج التحويل  ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text("اﻷتومات الحالي : حتمي "),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("الخطوة اﻷولى : "),
                  ),
                  //

                  Card(
                    color: AppColors.kLightGrey.withOpacity(.8),
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      title: Text("الحالات "),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(snapshot.data!.stepOne.p.toString()),
                      ),
                    ),
                  ),
                  Card(
                    color: AppColors.kLightGrey.withOpacity(.8),
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      title: Text("اﻷبجدية "),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(snapshot.data!.stepOne.segma.toString()),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: AppColors.kLightGrey.withOpacity(.8),
                          elevation: 0,
                          shape: AppStyles.cardStyle4,
                          child: ListTile(
                            title: Text("الحالة الأبتدائية"),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(snapshot.data!.stepOne.start),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: AppColors.kLightGrey.withOpacity(.8),
                          elevation: 0,
                          shape: AppStyles.cardStyle4,
                          child: ListTile(
                            title: Text("الحالات النهائية"),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child:
                                  Text(snapshot.data!.stepOne.end.toString()),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    color: AppColors.kLightGrey.withOpacity(.8),
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: DataTable(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: AppColors.kLightGrey)),
                          showBottomBorder: false,
                          columns: [
                            DataColumn(label: Icon(Mdi.stateMachine)),
                            for (int j = 0;
                                j < snapshot.data!.stepOne.segma.length;
                                ++j)
                              DataColumn(
                                label: Text(
                                  snapshot.data!.stepOne.segma[j].toString(),
                                  style: TextStyle(fontSize: 9.0.sp),
                                ),
                              ),
                          ],
                          rows: [
                            for (int i = 0;
                                i < snapshot.data!.stepOne.delta.length;
                                ++i)
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      snapshot.data!.stepOne.delta[i].first
                                          .toString(),
                                      style: TextStyle(fontSize: 9.0.sp),
                                    ),
                                  ),
                                  for (int k = 0;
                                      k <
                                          snapshot.data!.stepOne.delta[i].second
                                              .length;
                                      ++k)
                                    DataCell(Text(snapshot
                                        .data!.stepOne.delta[i].second[k]
                                        .toString(),
                                      style: TextStyle(fontSize: 9.0.sp),


                                    ))
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
