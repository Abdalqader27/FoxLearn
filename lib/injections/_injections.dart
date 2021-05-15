import 'package:foxlearn/injections/home_injection.dart';
import 'package:foxlearn/injections/intro_injection.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

// From Top To bottom
Future<void> init() async {
  HomeInjection.inject();
  IntroInjection.inject();
}
