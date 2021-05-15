import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/notification/widgets/count_card.dart';
import 'package:foxlearn/app/presentation/notification/widgets/notifi_card.dart';
import 'package:foxlearn/app/presentation/notification/widgets/notification_appbar.dart';
import 'package:foxlearn/app/presentation/root/widgets/root_background.dart';

import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CARD_COLOR,
      body: SafeArea(
        child: Stack(
          children: [
            RootBackground(
              marginBottom: 0.0,
              showAppbar: false,
            ),
            Column(
              //  padding: EdgeInsets.only(top: 15.0.h, left: 7.0.w, right: 7.0.w),
              // physics: NeverScrollableScrollPhysics(),
              children: [
                NotificationAppbar(),
                SizedBox(
                  height: 1.0.h,
                ),
                Center(child: CountCard(buttonText: "عدد الإشعارات: 10")),
                SizedBox(
                  height: 1.0.h,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => NotificationCard(),
                    itemCount: 10,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
