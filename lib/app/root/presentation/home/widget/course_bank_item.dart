import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CourseBank { Course, Bank }

class CourseBankItem extends StatelessWidget {
  final title;
  final count;
  final date;
  final CourseBank courseBank;

  const CourseBankItem({
    Key? key,
    this.title,
    this.count,
    this.date,
    required this.courseBank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
      child: ListTile(
        title: Text(
          "$title ",
          style: AppTextStyles.title().copyWith(fontSize: 12.0.sp),
        ),

        /// TODO WE HAVE TO -> CHANGE ICON WITH
        leading: Container(
          height: 6.5.h,
          width: 12.5.w,
          decoration: _getDecoration(courseBank),
          child: Icon(
            Icons.collections_bookmark_outlined,
            color: AppColors.LIGHT_BLACK,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${AppString.QUESTIONS_COUNT}  : $count"),
            Text("$date"),
          ],
        ),
      ),
    );
  }

  Decoration _getDecoration(courseBank) {
    if (courseBank == CourseBank.Course)
      return BoxDecoration(
        color: AppColors.ACCENT,
        borderRadius: BorderRadius.circular(15),
      );
    else
      return BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.ACCENT,
      );
  }
}
