import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/controllers/check_version_controller.dart';
import 'package:foxlearn/common/widgets/custom_flat_button.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateWidget extends StatelessWidget {
  final bool canSkipUpdate;
  final CheckVersionController controller;
  const UpdateWidget({Key? key, this.canSkipUpdate = false, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (canSkipUpdate) {
            controller.skip();
            return false;
          }
          return true;
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(5.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (canSkipUpdate)
                  Column(
                    children: [
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RawMaterialButton(
                          onPressed: () => controller.skip(),
                          child: Icon(
                            Icons.close,
                            size: 8.0.w,
                          ),
                          elevation: 0,
                          padding: EdgeInsets.all(2.0.w),
                          shape: CircleBorder(),
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                Spacer(),
                SvgPicture.asset(
                  Assets.svgFox,
                  width: 50.0.w,
                ),
                SizedBox(
                  height: 8.0.h,
                ),
                if (!canSkipUpdate)
                  Text(
                    'هذا الإصدار لم يعد مدعوماً!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium(fontWeight: FontWeight.bold),
                  ),
                Text(
                  ' يرجى تحميل أحدث إصدار لتتمتع بآخر الميزات !',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Spacer(),
                CustomFlatButton(
                  title: 'تحديث من الرابط المباشر',
                  onTap: _onTapUpdateDirect,
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                CustomFlatButton(
                  title: 'تحديث من المتجر',
                  onTap: _onTapUpdate,
                ),
                SizedBox(
                  height: 2.0.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTapUpdate() {
    if (Platform.isAndroid) {
      launch('https://play.google.com/store/apps/details?id=com.elkood.get_up');
    }
  }

  _onTapUpdateDirect() {
    if (Platform.isAndroid) {
      launch('http://getupedu.com/GetUP.apk');
    }
  }
}
