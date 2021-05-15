import 'package:foxlearn/app/infrastructure/data_sources/intro_data/intro_local_data.dart';
import 'package:foxlearn/app/infrastructure/repositories/intro_repository.dart';

import '_injections.dart';

class IntroInjection {
  static inject() {
    serviceLocator.registerLazySingleton(
          () => IntroLocalDataProvider(),
    );
    serviceLocator.registerLazySingleton(
          () => IntroRepository(introLocalDataProvider: serviceLocator()),
    );

  }
}
