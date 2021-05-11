import 'package:equatable/equatable.dart';

class RootState extends Equatable {
  final int indexPage;
  const RootState({required this.indexPage});

  @override
  List<Object> get props => [indexPage];
}
