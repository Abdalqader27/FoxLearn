import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foxlearn/app/presentation/notification/widgets/unread-point.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'card-noti-desc.dart';
import 'card-noti-title.dart';
import 'card_noti_date.dart';

class NotificationCard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final showMore = useState(false);
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: ExpandedCard(
        onTap: () {
          showMore.value = true;
          print(showMore.value.toString() + "firstChild");
        },
        maxLines: 1,
      ),
      secondChild: ExpandedCard(
        onTap: () {
          showMore.value = false;
          print(showMore.value.toString() + "secondChild");
        },
        maxLines: null,
      ),
      crossFadeState: !showMore.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class ExpandedCard extends StatelessWidget {
  final onTap;
  final int? maxLines;
  const ExpandedCard({Key? key, this.onTap, required this.maxLines}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(top: 1.0.h, left: 7.0.w, right: 7.0.w, bottom: 1.0.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [NotificationTitle(title: "عنوان الإشعار"), UnreadPoint()],
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: NotificationDesc(
                        maxLines: maxLines,
                        desc: 'صص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص'),
                  ),
                  NotificationDate(
                    date: "2-2-2020",
                  )
                ],
              ),
            ],
          ),
          padding: EdgeInsets.all(15.0.sp),
          decoration: BoxDecoration(
            color: AppColors.WHITE,
            border: Border.all(width: 1, color: AppColors.ACCENT),
            borderRadius: AppStyles.borderRadiusAll(25.0),
            boxShadow: [AppStyles.lightBoxShadow],
          )),
    );
  }
}
