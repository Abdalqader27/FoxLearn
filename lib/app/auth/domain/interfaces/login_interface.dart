import 'package:foxlearn/app/auth/infrastructure/models/user_crendentials_model.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';

abstract class LoginInterface {
  Future<UserModel?> signIn(UserCredentialsModel credentials, bool rememberLogin);
  Future logOut();

  UserModel getUser();

  bool? getLoginFlag();

  void setUserToken(String? token);
}
