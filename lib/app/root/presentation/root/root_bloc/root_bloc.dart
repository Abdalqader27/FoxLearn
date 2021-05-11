import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/root/application/root_facade_service.dart';

import 'bloc.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc({required this.rootService}) : super(RootState(indexPage: 1));
  final PageController pageController = PageController(initialPage: 1);
  final RootFacadeService rootService;

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    if (event is ChangeIndex) {
      pageController.jumpToPage(event.index);
      yield RootState(indexPage: event.index);
    }
  }
}
