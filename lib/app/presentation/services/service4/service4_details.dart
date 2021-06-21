import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/services/service1/automate_input_model.dart';
import 'package:foxlearn/app/presentation/services/service4/req_dfa_out.dart';
import 'package:foxlearn/app/presentation/services/service4/service4_api.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Service4Details extends StatefulWidget {
  final AutomateInput automate;

  const Service4Details({Key? key, required this.automate}) : super(key: key);

  @override
  _Service4DetailsState createState() => _Service4DetailsState();
}

class _Service4DetailsState extends State<Service4Details> {
  late Future<RegToDfaOut?> future;
  ScrollController _scrollController = ScrollController();
  bool flag = false;

  @override
  void initState() {
    future = Service4Api().regToDfa(automate: widget.automate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WelcomeBackground(
          child: FutureBuilder<RegToDfaOut?>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.data == null) return LottieLoading();
                final List<List<String>> stepOne = snapshot.data!.stepOne;
                if (!flag) {
                  stepOne.removeAt(0);
                  flag = !flag;
                }
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Card(
                      //   color: AppColors.kLightGrey.withOpacity(.4),
                      //   elevation: 0,
                      //   shape: AppStyles.cardStyle4,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: ListTile(
                      //       title: Text(
                      //         "النتيجة ",
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.w600, fontSize: 30),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: PageView(
                          children: [
                            Service4Steps(
                              stepOne: stepOne,
                              isFirst: true,
                            ),
                            Service4Steps(
                              stepOne: snapshot.data!.stepTwo,
                              isFirst: false,
                            ),
                            Card(
                              elevation: 0,
                              shape: AppStyles.cardStyle4,
                              color: AppColors.kLightGrey.withOpacity(.8),
                              margin: EdgeInsets.all(10),
                              child: Card(
                                  elevation: 0,
                                  shape: AppStyles.cardStyle4,
                                  margin: EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Scrollbar(
                                      child: SingleChildScrollView(
                                          reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(snapshot.data!.result,
                                                style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_ios),
                            SizedBox(
                              width: 10,
                            ),
                            Text("اسحب لعرض النتائج "),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class Service4Steps extends StatelessWidget {
  final stepOne;
  final bool isFirst;

  const Service4Steps({Key? key, this.stepOne, required this.isFirst})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: isFirst,
        shrinkWrap: true,
        itemCount: stepOne.length,
        itemBuilder: (_, i) {
          return Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: DottedBorder(
              color: AppColors.kGrey.withOpacity(.2),
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Card(
                      color: AppColors.kLightGrey.withOpacity(.8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "من أجل K = ${isFirst ? (i + 1) : i}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      elevation: 0,
                      shape: AppStyles.cardStyle4,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: AppStyles.cardStyle4,
                    color: AppColors.kLightGrey.withOpacity(.8),
                    margin: EdgeInsets.all(10),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: stepOne[i].length,
                      shrinkWrap: true,
                      itemBuilder: (_, j) {
                        return Card(
                            elevation: 0,
                            shape: AppStyles.cardStyle4,
                            margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                    reverse: true,
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(stepOne[i][j],
                                          style: TextStyle(
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600)),
                                    )),
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
