import '../exception-handler.dart';

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
