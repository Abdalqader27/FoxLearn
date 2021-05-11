import 'package:equatable/equatable.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object> get props => [];
}

class ChangeIndex extends RootEvent {
  final index;

  ChangeIndex(this.index);
}
