import 'check_validation_email.dart';
import 'check_validation_phone.dart';
import 'check_validation_textField.dart';

mixin LoginLogic {
  String? checkValidEmail(String? inputEmail) {
    return validEmail(inputEmail);
  }

  String? checkValidPhone(String? inputPhone) {
    return validPhone(inputPhone);
  }

  String? checkTextField(String? input) {
    return lengthValidate(input);
  }
}
