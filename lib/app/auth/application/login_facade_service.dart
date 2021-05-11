import 'package:foxlearn/app/auth/domain/logic/login_logic.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_crendentials_model.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/app/auth/infrastructure/repositories/user_repository.dart';

class LoginFacadeService with LoginLogic {
  const LoginFacadeService({
    required this.repository,
  });

  final UserRepository repository;

  Future<UserModel?> signIn(UserCredentialsModel credentials, bool? rememberLogin) async {
    return repository.signIn(credentials, rememberLogin ?? true);
  }

  Future logOut() async {
    repository.logOut();
  }

  UserModel getUser() {
    return repository.getUser();
  }

  bool? getLoginFlag() {
    return repository.getLoginFlag();
  }

  void setToken(String? token) {
    repository.setUserToken(token);
  }
}
