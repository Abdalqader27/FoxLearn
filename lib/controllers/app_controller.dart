
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AppController extends GetxController with StateMixin<Widget> {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
    //listenWidget().then((value) => change(value, status: RxStatus.success()));
  }

  // Future<Widget> listenWidget() async {
  //   /// Section to know who view can show it first
  //   if (!box.hasData(KEYS.INTRO_FLAG_KEY))
  //     return IntroScreen();
  //   else if ((GetStorage().read(KEYS.LOGIN_FLAG_KEY) ?? false)) {
  //     if (canEnter && !isBlocked) {
  //       return RootApp();
  //     }
  //   }
  //   return SignIn();
  // }
}
