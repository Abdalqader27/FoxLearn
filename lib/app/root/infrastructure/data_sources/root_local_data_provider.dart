import 'package:foxlearn/app/root/infrastructure/models/root_model.dart';

class RootLocalDataProvider {
  List<RootModel> _listItem = [
    RootModel(id: 1, title: "Codes", index: 0),
    RootModel(id: 2, title: "Home", index: 1),
    RootModel(id: 3, title: "MyNote", index: 2),
  ];

  List<RootModel> getRootElements() => _listItem;
}
