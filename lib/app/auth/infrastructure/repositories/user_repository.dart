import 'package:foxlearn/app/auth/domain/interfaces/login_interface.dart';
import 'package:foxlearn/app/auth/infrastructure/data_sources/user_local_data_provider.dart';
import 'package:foxlearn/app/auth/infrastructure/data_sources/user_remote_data_provider.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_crendentials_model.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/common/platform/connectivity.dart';

class UserRepository implements LoginInterface {
  UserRepository({
    required this.connectivity,
    required this.userLocalDataProvider,
    required this.userRemoteDataProvider,
  });

  final Connectivity connectivity;
  final UserLocalDataProvider userLocalDataProvider;
  final UserRemoteDataProvider userRemoteDataProvider;

  @override
  Future<UserModel?> signIn(UserCredentialsModel credentials, bool rememberLogin) async {
    if (await connectivity.isConnected) {
      try {
        final UserModel? requestUser = await userRemoteDataProvider.signInUser(credentials);
        if (requestUser != null) userLocalDataProvider.setUser(requestUser, rememberLogin);
        return requestUser;
      } catch (e) {
        print(e.toString() + "error");
        return null;
      }
    } else {
      //todo
      ///show dialog no internet
      return null;
    }
  }

  @override
  Future logOut() async {
    userLocalDataProvider.removeUser();
  }

  @override
  UserModel getUser() {
    return userLocalDataProvider.getUser();
  }

  @override
  bool? getLoginFlag() {
    return userLocalDataProvider.getLoginFlag();
  }

  @override
  void setUserToken(String? token) {
    userLocalDataProvider.setToken(token);
  }
}
