import 'package:foxlearn/injections/remote_services_inject.dart';
import 'package:foxlearn/injections/root_inject.dart';
import 'package:get_it/get_it.dart';

import 'auth_inject.dart';
import 'intro_inject.dart';

final serviceLocator = GetIt.instance;

// From Top To bottom
Future<void> init() async {
  IntroDependencies.inject();
  AuthDependencies.inject();
  RootDependencies.inject();
  RemoteDependencies.inject();
}
