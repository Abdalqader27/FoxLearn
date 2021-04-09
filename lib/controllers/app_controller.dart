import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_up/Database/locale_data_source.dart';
import 'package:get_up/Helper/Utils/Constant/keys.dart';
import 'package:get_up/Helper/Widgets/dialogs/custom_alert_dialog.dart';
import 'package:get_up/Repository/user_repository/user_repository_impl.dart';
import 'package:get_up/View/Introduction/OnBoarding/intro-screen.dart';
import 'package:get_up/View/Introduction/OnBoarding/intro_imports.dart';
import 'package:get_up/View/Register/Sign-In/sign-in.dart';
import 'package:get_up/View/Root/root-app.dart';

class AppController extends GetxController with StateMixin<Widget> {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    listenWidget().then((value) => change(value, status: RxStatus.success()));
  }

  Future<Widget> listenWidget() async {
    /// Section to know who view can show it first
    if (!box.hasData(KEYS.INTRO_FLAG_KEY))
      return IntroScreen();
    else if ((GetStorage().read(KEYS.LOGIN_FLAG_KEY) ?? false)) {
      if (canEnter && !isBlocked) {
        return RootApp();
      } else {
        GetStorage().write(KEYS.LOGIN_FLAG_KEY, false);
        GetStorage().remove(KEYS.USER_FLAG_KEY);
        await deleteAllData();
      }
    }
    return SignIn();
  }
}
