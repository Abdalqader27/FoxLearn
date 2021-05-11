import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxlearn/app/intro/domain/entities/intro.dart';
import 'package:foxlearn/app/intro/infrastructure/repositories/intro_repository.dart';
import 'package:foxlearn/app/intro/presentation/bloc/intro_bloc.dart';
import 'package:foxlearn/app/intro/presentation/widgets/intro_steppers.dart';
import 'package:foxlearn/app/intro/presentation/widgets/intro_template.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:foxlearn/injections/_injections.dart';

import 'bloc/intro_event.dart';
import 'bloc/intro_state.dart';

class IntroScreen extends StatelessWidget {
  final _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final List<Intro> list = serviceLocator<IntroRepository>().getIntroItems();
    return SafeArea(
      child: Scaffold(
        body: WelcomeBackground(
          child: BlocBuilder<IntroBloc, IntroState>(
            bloc: serviceLocator<IntroBloc>()..add(CheckIntroEvent(context)),
            builder: (context, state) {
              if (state is IntroPageState)
                return Column(children: <Widget>[
                  /// page view sections to set Items -------------------------------
                  Expanded(
                    flex: 8,
                    child: PageView(
                        controller: _pageViewController,
                        onPageChanged: (int index) {
                          serviceLocator<IntroBloc>()..add(ChangeEvent(index));
                        },
                        children: wrapToWidget(list)),
                  ),

                  /// buttons for intents  --------------------------------------------------
                  // Expanded(
                  //     child: Visibility(
                  //         visible: state.index == 3,
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 20.0, right: 20),
                  //           child: Center(
                  //             child: TextButton(
                  //               child: Text("الدخول "),
                  //               onPressed: () async {
                  //                 await GetStorage().write(AppKeys.INTRO_FLAG, true);
                  //                 Get.offNamed(AppRoutes.APP);
                  //               },
                  //             ),
                  //           ),
                  //         ))),

                  /// circle intro  --------------------------------------------------------------
                  IntroStepper(
                    indexPage: state.index,
                    pageController: _pageViewController,
                    countStepper: list.length,
                  ),
                ]);

              return const SizedBox();
            },
          ),
        ),
      ),
    );
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
