import 'bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeWidgetTab extends HomeEvent {
  final widget;

  ChangeWidgetTab(this.widget);
}
