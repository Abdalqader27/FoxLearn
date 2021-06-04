import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/api/api.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/infrastructure/models/user_data.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';
import 'package:foxlearn/common/helpers/date_helper.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController with StateMixin<bool> {
  /// In this controller the  is injection two params
  AppController _appController;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FocusNode focusNodePhone = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  final formKey = GlobalKey<FormState>();

  SignInController(this._appController);

  @override
  void onInit() {
    super.onInit();
    change(true, status: RxStatus.success());
  }

  onClickOk() {
    if (formKey.currentState!.validate()) {
      final phone = phoneController.text;
      final password = passwordController.text;
      change(false, status: RxStatus.loading());
      ApiRepository.apiUser.signIn(phone, password).then((value) {
        value.when(
          success: (data) {
            try {
              Get.snackbar("مرحبا", "تم تسجيل الدخول",
                  snackPosition: SnackPosition.TOP, margin: EdgeInsets.all(10));
              GetStorage().write(AppKeys.LOGIN_FLAG_KEY, true);
              UserAccount account = UserAccount.fromJson(data.toJson());
              account.dob = DateTime.parse(
                  DateHelper.dayFormat(account.dob.toString()).toString());
              GetStorage()
                  .write(AppKeys.USER_FLAG_KEY, json.encode(account.toJson()));
              _appController.login();
          //    Get.delete<SignInController>(force: true);
            } catch (e) {
              print(e);
            }
          },
          failure: (error) {
            print("my error " + error.toString());
            Get.snackbar("فشل ", NetworkExceptions.getErrorMessage(error),
                snackPosition: SnackPosition.BOTTOM,
                margin: EdgeInsets.all(10),
                backgroundColor: AppColors.LIGHT_Red);
            change(false, status: RxStatus.success());
          },
        );
      }, onError: (error) {
        Get.snackbar("مرحبا", "حدث خطأ ما ",
            snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10));
        change(false, status: RxStatus.success());
      });
    }
  }
}
