import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/notification/widgets/count_card.dart';
import 'package:foxlearn/app/presentation/notification/widgets/notifi_card.dart';
import 'package:foxlearn/common/widgets/app-button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'all_notification_screen.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //  padding: EdgeInsets.only(top: 15.0.h, left: 7.0.w, right: 7.0.w),
      // physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 5.0.h,
        ),
        Center(child: CountCard(buttonText: "عدد الإشعارات: 10")),
        SizedBox(
          height: 3.0.h,
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 5)
                return Center(
                    heightFactor: 1.5,
                    child: AppButton(
                        onPressed: () async {
                          // await notificationDialog(
                          //     context: context,
                          //     subTitle: " body!",
                          //     title: " title!");
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllNotificationScreen(),
                          ));
                        },
                        buttonText: "عرض الكل"));
              else
                return NotificationCard();
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
