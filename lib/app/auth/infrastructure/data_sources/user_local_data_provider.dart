import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get_storage/get_storage.dart';

class UserLocalDataProvider {
  UserModel getUser() {
    ///get user from shared
    return UserModel.fromJson(GetStorage().read(AppKeys.USER_FLAG));
  }

  Future setUser(UserModel user, bool rememberLogin) {
    ///set user in shared
    GetStorage().write(AppKeys.USER_FLAG, user.toJson());

    ///set login key true
    if (rememberLogin)
      GetStorage().write(AppKeys.LOGIN_FLAG, true);
    else
      GetStorage().write(AppKeys.LOGIN_FLAG, false);
    return Future.value(true);
  }

  Future removeUser() {
    ///remove user from shared
    GetStorage().remove(AppKeys.USER_FLAG);

    ///set login key false
    GetStorage().write(AppKeys.LOGIN_FLAG, false);
    return Future.value(true);
  }

  bool? getLoginFlag() {
    ///get Login Flag from shared
    return GetStorage().read(AppKeys.LOGIN_FLAG);
  }

  void setToken(String? token) {
    ///check if the token saved before
    String? oldToken = GetStorage().read(AppKeys.USER_TOKEN);

    ///set value token
    if (token != null && oldToken == null) {
      print("set user token");
      print("firebase Token $token");
      GetStorage().write(AppKeys.USER_TOKEN, token);
    } else if (token != null) {
      print("user token already saved");
      print("firebase Token $token");
    }
  }

  List<String> fakeCollege = [
    "الهندسة المعلوماتية1",
    "الهندسة المعلوماتية2",
    "الهندسة المعلوماتية3",
    "الهندسة المعلوماتية4",
    "الهندسة المعلوماتية5",
    "الهندسة المعلوماتية6",
    "الهندسة المعلوماتية7",
    "الهندسة المعلوماتية8",
  ];
}
