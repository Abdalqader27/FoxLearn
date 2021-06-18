import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/tests/controllers/question_controller.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class QuizScreen extends GetView<QuestionController> {
  final int id;

  const QuizScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => QuestionController());
    controller.getQuestion(id);
    return WelcomeBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: controller.obx(
          (state) => Body(),
          onLoading: LottieLoading(),
        ),
      ),
    );
  }
}
