import 'package:foxlearn/common/http_client/dio_client.dart';
import 'package:foxlearn/common/platform/connectivity.dart';
import 'package:foxlearn/common/utils/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '_injections.dart';

class RemoteDependencies {
  static inject() {
    serviceLocator.registerLazySingleton(() => DioClient(BASE_URL));
    serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
    serviceLocator.registerLazySingleton(() => Connectivity(internetChecker: serviceLocator()));
  }
}
