import 'package:foxlearn/app/root/domain/interfaces/root_interface.dart';
import 'package:foxlearn/app/root/infrastructure/data_sources/root_local_data_provider.dart';
import 'package:foxlearn/app/root/infrastructure/models/root_model.dart';

class RootRepository implements RootInterface {
  RootRepository({required this.rootLocalDataProvider});

  final RootLocalDataProvider rootLocalDataProvider;

  @override
  List<RootModel> getRootElements() {
    return rootLocalDataProvider.getRootElements();
  }
}
