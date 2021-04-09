
import 'package:get_up/Helper/Services/Error-Handling/exception-handler.dart';

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
