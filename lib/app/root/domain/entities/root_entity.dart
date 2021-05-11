import 'package:equatable/equatable.dart';

class RootEntity extends Equatable {
  RootEntity({
    required this.id,
    required this.index,
    required this.title,
  });

  final int id;
  final String title;
  final int index;

  @override
  List<Object> get props => [id, title];
}
