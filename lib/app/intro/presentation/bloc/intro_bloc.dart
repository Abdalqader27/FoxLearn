import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxlearn/common/app_router/pages.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'intro_event.dart';
import 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(CheckIntroState());
  final introFlag = GetStorage().read(AppKeys.INTRO_FLAG);

  int _pageIndex = 0;

  @override
  Stream<IntroState> mapEventToState(IntroEvent event) async* {
    if (introFlag ?? false) Get.offNamed(AppRoutes.APP);
    if (event is CheckIntroEvent) {
      yield IntroPageState(index: _pageIndex);
    } else if (event is IncrementEvent) {
      _pageIndex++;
      yield IntroPageState(index: _pageIndex);
    } else if (event is DecrementEvent) {
      _pageIndex--;
      yield IntroPageState(index: _pageIndex);
    } else if (event is ChangeEvent) {
      _pageIndex = event.index;
      yield IntroPageState(index: _pageIndex);
    }
  }
}
