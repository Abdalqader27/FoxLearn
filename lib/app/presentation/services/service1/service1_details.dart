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
    return SafeArea(
      child: Scaffold(
        body: WelcomeBackground(
          child: FutureBuilder<NfaDfaModel?>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.data == null) return LottieLoading();
                return Stack(
                  children: [
                    PageView(
                      children: [
                        StepsServices(
                          data: snapshot.data!.stepOne,
                          text: "الخطوة اﻷولى",
                        ),
                        StepsServices(
                          data: snapshot.data!.stepTwo,
                          text: "الخطوة الثانية",
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class StepsServices extends StatefulWidget {
  final text;
  final dynamic data;

  const StepsServices({Key? key, required this.data, this.text})
      : super(key: key);

  @override
  _StepsServicesState createState() => _StepsServicesState(data);
}

class _StepsServicesState extends State<StepsServices> {
  final dynamic data;

  _StepsServicesState(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
      children: [
        Card(
          color: AppColors.kLightGrey.withOpacity(.4),
          elevation: 0,
          shape: AppStyles.cardStyle4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "${widget.text}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              subtitle: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("يمكنك  يتم التحويل من حالة الى حالة"),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      title: Text("الحالات "),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(data.p
                            .toSet()
                            .toString()
                            .replaceAll("}", "")
                            .replaceAll("{", "")),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      title: Text("اﻷبجدية "),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(data.segma
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      title: Text("الحالة الأبتدائية"),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(data.start),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: ListTile(
                      title: Text("الحالات النهائية"),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(data.end
                            .toSet()
                            .toString()
                            .replaceAll("}", "")
                            .replaceAll("{", "")),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: ListTile(
                          title: Directionality(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("جدول الانتقال"),
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          subtitle: DataTable(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: AppColors.kLightGrey)),
                            showBottomBorder: false,
                            columns: [
                              DataColumn(label: Icon(Mdi.stateMachine)),
                              for (int j = 0; j < data.segma.length; ++j)
                                DataColumn(
                                  label: Text(
                                    data.segma[j].toString(),
                                    style: TextStyle(fontSize: 9.0.sp),
                                  ),
                                ),
                            ],
                            rows: [
                              for (int i = 0; i < data.delta.length; ++i)
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        data.delta[i].first.toString(),
                                        style: TextStyle(fontSize: 9.0.sp),
                                      ),
                                    ),
                                    for (int k = 0;
                                        k < data.delta[i].second.length;
                                        ++k)
                                      DataCell(Text(
                                        data.delta[i].second[k].toString(),
                                        style: TextStyle(fontSize: 9.0.sp),
                                      ))
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
      ],
    );
  }
}
