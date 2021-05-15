import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/infrastructure/models/bank_question.dart';

import 'item_quiz_bank.dart';

class QuizBank extends StatefulWidget {
  @override
  _QuizBankState createState() => _QuizBankState();
}

class _QuizBankState extends State<QuizBank> with TickerProviderStateMixin {
  late AnimationController animationController;
  TextEditingController code = new TextEditingController();
  bool isTryForSendingCode = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, parentIndex) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25, bottom: 13),
                            child: Text(
                              "subject",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          width: double.infinity,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            child: FutureBuilder<bool>(
                              future: getData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<bool> snapshotChild) {
                                if (!snapshotChild.hasData) {
                                  return const SizedBox();
                                } else {
                                  return ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0, right: 16, left: 16),
                                    itemCount: 2,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final int count = 5 > 10 ? 10 : 5;
                                      final Animation<double> animation =
                                          Tween<double>(begin: 0.0, end: 1.0)
                                              .animate(CurvedAnimation(
                                                  parent: animationController,
                                                  curve: Interval(
                                                      (1 / count) * index, 1.0,
                                                      curve: Curves
                                                          .fastOutSlowIn)));
                                      animationController.forward();
                                      // return Container(
                                      //   height: 100,
                                      //   child: Card(
                                      //     child: ListTile(
                                      //       title:Text( snapshot.data[parentIndex].subjectExamsList[index].subjectExamName),
                                      //     ),
                                      //   ),
                                      // );
                                      return ItemQuizBankWidget(
                                        itemQuizBank: QuestionBankModule(
                                            classSubjectId: 1,
                                            classSubjectName: "heu",
                                            subjectExamsList: [
                                              SubjectExamsList(
                                                  examQuestionsList: [],
                                                  isActivated: true,
                                                  subjectExamId: 1,
                                                  subjectExamName: "اللغات الصورية"),
                                              SubjectExamsList(
                                                  examQuestionsList: [],
                                                  isActivated: true,
                                                  subjectExamId: 1,
                                                  subjectExamName: "all")
                                            ]).subjectExamsList[index],
                                        animation: animation,
                                        animationController:
                                            animationController,
                                        callback: () {},
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ],
              );
            }));
  }
}
