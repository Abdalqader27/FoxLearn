import 'package:foxlearn/app/intro/domain/entities/intro.dart';

abstract class IntroInterface {
  List<Intro> getIntroItems();

  Intro getItemById(int id);
}
