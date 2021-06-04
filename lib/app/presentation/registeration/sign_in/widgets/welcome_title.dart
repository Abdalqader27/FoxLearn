import 'package:flutter/cupertino.dart';
import 'package:foxlearn/app/presentation/registeration/sign_up/sign_up.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/outline_button.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:get/get.dart';

class WelcomeTitle {
  Widget welcomeTitle() => Positioned(
      left: 20,
      right: 20,
      top: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('مرحبا بك ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),
                Text('سعيدون لمقابلتك ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ],
            ),
          ),

          OutlineNeuButton(
              text: AppString.NEW_ACCOUNT, onTap: () => Get.to(() => SignUp())),
        ],
      ));
}
