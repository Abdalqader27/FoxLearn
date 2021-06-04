import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/controllers/intro_controller.dart';
import 'package:foxlearn/app/presentation/on_boarding/components/intro_steppers.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/neu_button.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'components/intro_items.dart';

class IntroScreen extends GetView<IntroController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<IntroController>(() => IntroController());
    final _pageViewController = PageController(initialPage: 0);
    return Scaffold(
        body: controller.obx(((index) => SafeArea(
                child: Column(children: <Widget>[
              IntroStepper(
                  pageController: _pageViewController, countStepper: 4),
              Expanded(
                  flex: 8,
                  child: PageView(
                      controller: _pageViewController,
                      onPageChanged: (int index) =>
                          controller.changePage(index),
                      children: introItem)),
              Expanded(
                  child: Visibility(
                      visible: controller.indexPage == 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Center(
                            child: NeuFlatButton(
                              color: AppColors.LIGHT_Red,
                                text: "الدخول ",
                                onTap: () => {
                                      GetStorage()
                                          .write(AppKeys.INTRO_FLAG_KEY, true),
                                      Get.find<AppController>().exitIntro(),
                                    })),
                      ))),
            ])))));
  }
}
