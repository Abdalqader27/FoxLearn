import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/api/api.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/infrastructure/models/user_data.dart';
import 'package:foxlearn/common/exceptions/network_expcepations/network_exceptions.dart';
import 'package:foxlearn/common/objects.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
class SignUpController extends GetxController with StateMixin<bool> {
  /// In this controller the  is injection two params
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode focusNodePhone = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeName = FocusNode();
  final FocusNode focusNodeLastName = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeBirthday = FocusNode();

  @override
  void onInit() {
    super.onInit();
    change(true, status: RxStatus.success());
  }

  // onClickOk() {
  //   if (formKey.currentState!.validate()) {
  //     change(false, status: RxStatus.loading());
  //     UserAccount user = UserAccount(
  //         id: 0,
  //         dob: DateFormat("yyyy-MM-dd")
  //             .parse(birthdayController.text.toString()),
  //         email: emailController.text,
  //         lastName: lastNameController.text,
  //         firstName: nameController.text,
  //         deviceToken: firebaseToken,
  //         //  username: _controllers.nameController.text+"  "+_controllers.lastNameController.text,
  //         password: passwordController.text,
  //         phoneNumber: phoneController.text, userName: null);
  //     print(user.toJson());
  //
  //     ApiRepository.apiUser.signUp(user).then((value) {
  //       value.when(
  //         success: (data) {
  //           GetStorage().write(AppKeys.LOGIN_FLAG_KEY, true);
  //           user.id = data.id;
  //           user.token = data.token;
  //           user.s3Credentials = data.s3Credentials;
  //           GetStorage()
  //               .write(AppKeys.USER_FLAG_KEY, json.encode(user.toJson()));
  //           change(true, status: RxStatus.success());
  //           Get.back();
  //           Get.find<AppController>().login();
  //           Get.snackbar("مرحبا", "تم تسجيل الدخول",
  //               snackPosition: SnackPosition.BOTTOM,
  //               margin: EdgeInsets.all(10),
  //               backgroundColor: AppColors.LIGHT_Green);
  //         },
  //         failure: (error) {
  //           print("my error " + error.toString());
  //           // Get.snackbar("فشل ", NetworkExceptions.getErrorMessage(()),
  //           //     snackPosition: SnackPosition.BOTTOM,
  //           //     margin: EdgeInsets.all(10),
  //           //     backgroundColor: AppColors.LIGHT_Red);
  //           change(false, status: RxStatus.success());
  //         },
  //       );
  //     }, onError: (error) {
  //       Get.snackbar("مرحبا", "حدث خطأ ما ",
  //           snackPosition: SnackPosition.BOTTOM,
  //           margin: EdgeInsets.all(10),
  //           backgroundColor: AppColors.LIGHT_Red);
  //       change(false, status: RxStatus.success());
  //     });
  //   }
  // }
}
