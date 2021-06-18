import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/tests/controllers/question_controller.dart';
import 'package:foxlearn/app/presentation/tests/models/Questions.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import '../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Card(
            elevation: 1,
            shape: AppStyles.cardStyle2,
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: 20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    question.question,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kBlackColor),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  ...List.generate(
                    question.options.length,
                    (index) => Option(
                      index: index,
                      text: question.options[index],
                      press: () => _controller.checkAns(question, index),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
