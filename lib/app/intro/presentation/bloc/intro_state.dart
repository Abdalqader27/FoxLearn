import 'package:equatable/equatable.dart';

abstract class IntroState extends Equatable {
  const IntroState();
}

class IntroPageState extends IntroState {
  final int index;
  const IntroPageState({required this.index});
  @override
  List<Object> get props => [index];
}

class CheckIntroState extends IntroState {
  const CheckIntroState();
  @override
  List<Object?> get props => [];
}
