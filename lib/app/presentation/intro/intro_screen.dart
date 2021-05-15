import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxlearn/app/controllers/intro_controller.dart';
import 'package:foxlearn/app/domain/entities/intro.dart';
import 'package:foxlearn/app/infrastructure/repositories/intro_repository.dart';

import 'package:foxlearn/app/presentation/intro/widgets/intro_steppers.dart';
import 'package:foxlearn/app/presentation/intro/widgets/intro_template.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:get/get.dart';

class IntroScreen extends GetView<IntroController> {
  final _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final List<Intro> list = serviceLocator<IntroRepository>().getIntroItems();
    return Scaffold(
        body: Obx(()=>Column(children: <Widget>[
          /// page view sections to set Items -------------------------------
          Expanded(
            flex: 8,
            child: PageView(
                controller: _pageViewController,
                onPageChanged: (int index) {
                  controller.setPageIndex(index);
                },
                children: wrapToWidget(list)),
          ),

          /// circle intro  --------------------------------------------------------------
          IntroStepper(
            indexPage: controller.indexPage.value,
            pageController: _pageViewController,
            countStepper: list.length,
          ),
        ])));
  }

  List<Widget> wrapToWidget(list) {
    List<Widget> _listWidget = [];
    for (Intro introModel in list) {
      _listWidget.add(IntroTemplate(
          id: introModel.id,
          title: introModel.title,
          subtitle: introModel.description,
          image: introModel.image));
    }
    return _listWidget;
  }
}
