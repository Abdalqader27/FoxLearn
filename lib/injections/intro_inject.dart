import 'package:foxlearn/app/intro/infrastructure/data_sources/intro_local_data_provider.dart';
import 'package:foxlearn/app/intro/infrastructure/repositories/intro_repository.dart';
import 'package:foxlearn/app/intro/presentation/bloc/intro_bloc.dart';

import '_injections.dart';

class IntroDependencies {
  static inject() {
    serviceLocator.registerLazySingleton(
      () => IntroLocalDataProvider(),
    );
    serviceLocator.registerLazySingleton(
      () => IntroRepository(introLocalDataProvider: serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => IntroBloc(),
    );
  }
}
