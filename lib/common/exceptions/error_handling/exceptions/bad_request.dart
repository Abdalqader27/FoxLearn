import '../exception_handler.dart';

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
