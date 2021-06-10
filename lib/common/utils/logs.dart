import 'package:logger/logger.dart';

class Logs {
  static var logger = Logger(
    printer: PrettyPrinter(),
  );

  static var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
}
