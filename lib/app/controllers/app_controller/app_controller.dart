import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/app_controller/app_state.dart';
import 'package:foxlearn/common/services/notifications_fireBase.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  final box = GetStorage();
//  final BuildContext context;
  Rx<AppState> appState;
  bool showAdsContent = true;

  AppController(this.appState);

  @override
  void onInit() {
    super.onInit();
  //  FirebaseNotification(context: context).setUpFirebase();
    listenWidget();
  }

  listenWidget() async {
    /// Section to know who view can show it first
    if (!box.hasData(AppKeys.INTRO_FLAG_KEY)) {
      appState.value = AppState.intro();
    } else if (box.read(AppKeys.LOGIN_FLAG_KEY) ?? false) {
      login();
    } else {
      appState.value = AppState.loggedOut();
    }
  }

  logout() async {
    appState.value = AppState.loggedOut();
    box.write(AppKeys.LOGIN_FLAG_KEY, false);
    box.remove(AppKeys.USER_FLAG_KEY);
  }

  login() {
    appState.value = AppState.loggedIn();
  }

  exitIntro() {
    appState.value = AppState.loggedOut();
  }
}
