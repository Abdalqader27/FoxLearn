import 'package:foxlearn/app/domain/entities/intro.dart';

abstract class IntroInterface {
  List<Intro> getIntroItems();

  Intro getItemById(int id);
}
