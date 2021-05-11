String? validPhone(String? inputPhone) {
  final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

  if (inputPhone != null) if (inputPhone.trim().length >= 10) if (numericRegex
      .hasMatch(inputPhone)) {
    return null;
  } else {
    return "   تأكد من إدخال الأرقام بشكل صحيح";
  }
  return "   تأكد من إدخال الأرقام بشكل صحيح";
}
