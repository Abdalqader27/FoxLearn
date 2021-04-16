import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WelcomeTitle {
  Widget welcomeTitle() => Positioned(
      left: 50,
      right: 50,
      top: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hello'.tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),
          Text('Nice to meet you '.tr,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        ],
      ));
}
