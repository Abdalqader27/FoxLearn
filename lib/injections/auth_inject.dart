import 'package:foxlearn/app/auth/application/login_facade_service.dart';
import 'package:foxlearn/app/auth/infrastructure/data_sources/user_local_data_provider.dart';
import 'package:foxlearn/app/auth/infrastructure/data_sources/user_remote_data_provider.dart';
import 'package:foxlearn/app/auth/infrastructure/repositories/user_repository.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_state.dart';
import 'package:foxlearn/common/http_client/dio_client.dart';

import '_injections.dart';

class AuthDependencies {
  static inject() {
    serviceLocator.registerLazySingleton(
      () => UserLocalDataProvider(),
    );
    serviceLocator.registerLazySingleton(
      () => UserRemoteDataProvider(dioClient: serviceLocator<DioClient>()),
    );
    serviceLocator.registerLazySingleton(
      () => UserRepository(
          userLocalDataProvider: serviceLocator(),
          userRemoteDataProvider: serviceLocator(),
          connectivity: serviceLocator()),
    );
    serviceLocator.registerLazySingleton(
      () => LoginFacadeService(repository: serviceLocator()),
    );

    serviceLocator.registerLazySingleton(
      () => AuthBloc(CheckingAuth(), serviceLocator<LoginFacadeService>()),
    );
  }
}
