import 'package:foxlearn/app/domain/entities/intro.dart';
import 'package:foxlearn/app/domain/interfaces/intro_interface.dart';
import 'package:foxlearn/app/infrastructure/data_sources/intro_data/intro_local_data.dart';


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
