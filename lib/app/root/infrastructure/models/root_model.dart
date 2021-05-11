import 'package:foxlearn/app/root/domain/entities/root_entity.dart';

class RootModel extends RootEntity {
  RootModel({
    required int id,
    required String title,
    required int index,
  }) : super(id: id, title: title, index: index);

  factory RootModel.fromJson(Map<String, dynamic> json) {
    return RootModel(
      index: json['index'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'index': index};
  }
}
