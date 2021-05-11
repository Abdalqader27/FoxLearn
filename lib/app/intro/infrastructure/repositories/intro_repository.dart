import 'package:foxlearn/app/intro/domain/entities/intro.dart';
import 'package:foxlearn/app/intro/domain/interfaces/intro_interface.dart';
import 'package:foxlearn/app/intro/infrastructure/data_sources/intro_local_data_provider.dart';

class IntroRepository implements IntroInterface {
  IntroRepository({required this.introLocalDataProvider});

  final IntroLocalDataProvider introLocalDataProvider;

  @override
  List<Intro> getIntroItems() {
    return introLocalDataProvider.getIntroItems();
  }

  @override
  Intro getItemById(int id) {
    return introLocalDataProvider.getItemById(id);
  }
}
