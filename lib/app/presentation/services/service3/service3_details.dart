import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/services/service1/automate_input_model.dart';
import 'package:foxlearn/app/presentation/services/service1/nfa_dfa_output.dart';
import 'package:foxlearn/app/presentation/services/service1/service1_api.dart';
import 'package:foxlearn/app/presentation/services/service3/eps_nfa_dfa.dart';
import 'package:foxlearn/app/presentation/services/service3/service3_api.dart';
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

class Service3Details extends StatefulWidget {
  final AutomateInput automate;

  const Service3Details({Key? key, required this.automate}) : super(key: key);

  @override
  _Service3DetailsState createState() => _Service3DetailsState();
}

class _Service3DetailsState extends State<Service3Details> {
  late Future<EpsNfaDfa?> future;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    future = Service3Api().epsNfaDfa(automate: widget.automate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Api" + widget.automate.toString());
    return SafeArea(
      child: Scaffold(
        body: WelcomeBackground(
          child: FutureBuilder<EpsNfaDfa?>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.data == null) return LottieLoading();
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
                            "النتيجة ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 30),
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
                                    child: Text(snapshot.data!.q.toString()),
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
                                    child:
                                        Text(snapshot.data!.segma.toString()),
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
                                    child: Text(snapshot.data!.start),
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
                                    child: Text(snapshot.data!.end.toString()),
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    child: ListTile(
                                      title: Directionality(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("جدول الانتقال"),
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      subtitle: Scrollbar(
                                        isAlwaysShown: true,
                                        controller: _scrollController,
                                        child: SingleChildScrollView(
                                          controller: _scrollController,
                                          scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color:
                                                        AppColors.kLightGrey)),
                                            showBottomBorder: false,
                                            columns: [
                                              DataColumn(
                                                  label:
                                                      Icon(Mdi.stateMachine)),
                                              for (int j = 0;
                                                  j <
                                                      snapshot
                                                          .data!.segma.length;
                                                  ++j)
                                                DataColumn(
                                                  label: Text(
                                                    snapshot.data!.segma[j]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 9.0.sp),
                                                  ),
                                                ),
                                            ],
                                            rows: [
                                              for (int i = 0;
                                                  i < snapshot.data!.q.length;
                                                  ++i)
                                                DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        snapshot.data!.q[i]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 9.0.sp),
                                                      ),
                                                    ),
                                                    for (int k = 0;
                                                        k <
                                                            snapshot
                                                                .data!
                                                                .delta[i]
                                                                .length;
                                                        ++k)
                                                      DataCell(Text(
                                                        snapshot
                                                            .data!.delta[i][k]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 9.0.sp),
                                                      ))
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
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
              }),
        ),
      ),
    );
  }
}
