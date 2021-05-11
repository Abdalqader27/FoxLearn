String? validEmail(String? inputEmail) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (inputEmail != null && RegExp(emailRegex).hasMatch(inputEmail)) {
    return null;
  } else {
    return "   يرجى كتابة الإيميل بشكل صحيح";
  }
}
