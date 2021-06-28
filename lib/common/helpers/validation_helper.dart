class ValidationHelper {
  static String? validPhone(String? inputPhone) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    if (inputPhone != null) if (inputPhone.trim().length >= 10) if (numericRegex
        .hasMatch(inputPhone)) {
      return null;
    } else {
      return " تأكد من إدخال رقم الهاتف بشكل صحيح";
    }
    return " تأكد من إدخال رقم الهاتف بشكل صحيح";
  }

  static String? validEmail(String? inputEmail) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (inputEmail != null && RegExp(emailRegex).hasMatch(inputEmail)) {
      return null;
    } else {
      return " يرجى كتابة الإيميل بشكل صحيح";
    }
  }

  static String? lengthValidate(String? value) {
    if (value?.trim().length == 0) return "الرجاء ادخال بياناتك";
    return null;
  }
}
