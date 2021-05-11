import 'package:foxlearn/app/root/application/root_facade_service.dart';
import 'package:foxlearn/app/root/infrastructure/data_sources/root_local_data_provider.dart';
import 'package:foxlearn/app/root/infrastructure/repositories/root_repository.dart';
import 'package:foxlearn/app/root/presentation/root/root_bloc/root_bloc.dart';

import '_injections.dart';

class RootDependencies {
  static inject() {
    serviceLocator.registerLazySingleton(
      () => RootLocalDataProvider(),
    );

    serviceLocator.registerLazySingleton(
      () => RootRepository(
        rootLocalDataProvider: serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton(
      () => RootFacadeService(repository: serviceLocator()),
    );

    serviceLocator.registerLazySingleton(
      () => RootBloc(rootService: serviceLocator<RootFacadeService>()),
    );
  }
}
