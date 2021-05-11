import 'package:foxlearn/app/intro/domain/entities/intro.dart';

class IntroModel extends Intro {
  IntroModel({
    required int id,
    required String title,
    required String image,
    required String description,
  }) : super(id: id, title: title, image: image, description: description);

  factory IntroModel.fromJson(Map<String, dynamic> json) {
    return IntroModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
    };
  }
}
