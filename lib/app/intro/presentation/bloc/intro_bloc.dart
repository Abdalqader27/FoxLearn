import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(CheckIntroState());

  int _pageIndex = 0;
  @override
  Stream<IntroState> mapEventToState(IntroEvent event) async* {
    if (event is CheckIntroEvent) {
      // final introFlag = GetStorage().read(AppKeys.INTRO_FLAG);
      // if (introFlag ?? false) {
      //   Get.offNamed(AppRoutes.APP);
      // } else
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
