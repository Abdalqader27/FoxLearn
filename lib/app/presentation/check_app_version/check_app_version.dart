import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/check_version_controller.dart';
import 'package:foxlearn/app/presentation/check_app_version/update_widget.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:get/get.dart';
class CheckAppVersion extends GetView<CheckVersionController> {
  final Widget Function() builder;

  CheckAppVersion({required this.builder});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckVersionController());
    return Scaffold(
      body: controller.obx((state) {
        if (!state!.item1)
          return UpdateWidget(
            canSkipUpdate: false,
            controller: controller,
          );
        else if (state.item2)
          return UpdateWidget(
            controller: controller,
            canSkipUpdate: true,
          );
        else
          return builder();
      }, onLoading: LottieLoading()),
    );
  }
}
