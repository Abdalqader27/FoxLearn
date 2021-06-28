import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/dio_client.dart';
import 'package:foxlearn/common/utils/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '_injections.dart';

class RemoteDependencies {
  static inject() {
    serviceLocator.registerLazySingleton(
      () => DioClient(ApiRoutes.BASE_API),
    );
    serviceLocator.registerLazySingleton(
      () => InternetConnectionChecker(),
    );
  }
}
