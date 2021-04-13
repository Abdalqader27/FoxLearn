class  SignImpl {
  bool changedObscure = false;
  bool visible = false;

  bool validate6chars(String value) {
    visible = (value.length > 6) ? true : false;
    print('controller $visible');
    return visible;
  }

  bool validateEmail(String value) {
    print('hello');
    print(value);
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    bool emailValid = regExp.hasMatch(value);
    print('inside validateEmail: $visible');
    if (emailValid)
      visible = true;
    else
      visible = false;
    return emailValid;
  }

  bool changeVisibilityOfPassword() {
    changedObscure = !changedObscure;
    return changedObscure;
  }
}
