import 'package:equatable/equatable.dart';

class Intro extends Equatable {
  Intro({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  final int id;
  final String title;
  final String image;
  final String description;

  @override
  List<Object> get props => [id, title, image, description];
}
