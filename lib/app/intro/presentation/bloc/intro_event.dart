import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

class CheckIntroEvent extends IntroEvent {
  final BuildContext context;

  CheckIntroEvent(this.context);
}

class IncrementEvent extends IntroEvent {}

class DecrementEvent extends IntroEvent {}

class ChangeEvent extends IntroEvent {
  final index;

  ChangeEvent(this.index);
}
