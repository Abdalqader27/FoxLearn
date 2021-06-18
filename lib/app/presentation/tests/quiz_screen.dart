import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/tests/controllers/question_controller.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return WelcomeBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,

        body: Body(),
      ),
    );
  }
}
