import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/common/widgets/circle-card.dart';
import 'package:foxlearn/common/widgets/flutter_dash.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoteCard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final showMore = useState(false);
    return AnimatedCrossFade(
      crossFadeState: !showMore.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
      firstChild: FirstChild(
        collegeName: "كلية الطب البشري - جامعة حلب",
        date: "20-2-2020",
        noteTitle: "اسم الملاحظة",
        showMore: showMore,
      ),
      secondChild: SecondChild(
        showMore: showMore,
        noteTitle: "اسم الملاحظة",
        date: "20-2-2020",
        subjectName: "توليد",
        collegeName: "كلية الطب البشري - جامعة حلب",
        section: "دورة 2017-2019",
      ),
    );
  }
}

class FirstChild extends StatelessWidget {
  final String collegeName;
  final String date;
  final String noteTitle;
  final ValueNotifier<bool> showMore;

  const FirstChild(
      {Key? key,
      required this.collegeName,
      required this.date,
      required this.noteTitle,
      required this.showMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMore.value = true,
      child: Container(
        width: 100.0.w,
        alignment: Alignment.center,
        // decoration: BoxDecoration(boxShadow: [AppStyles.darkBoxShadow]),
        //margin: EdgeInsets.only(top: 0.1.w, bottom: 0.1.w),
        child: Stack(
          children: [
            Positioned(
              top: 1.0.h,
              bottom: 2.7.h,
              right: 1.8.h,
              left: 1.8.h,
              child: Center(
                child: Container(
                  height: 20.0.h,
                  width: 93.0.w,
                  decoration: BoxDecoration(
                      color: AppColors.WHITE,
                      boxShadow: [AppStyles.lightBoxShadow],
                      borderRadius: AppStyles.borderRadiusB,
                      border: Border.all(color: AppColors.PRIMARY, width: 1)),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 12.0.h,
                width: 100.0.w,
                child: SvgPicture.asset(
                  Assets.svgNoteCard,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 100.0.w,
                child: ListTile(
                  leading: CircleCard(
                    backgroundColor: AppColors.WHITE,
                    child: SvgPicture.asset(
                      Assets.svgBank,
                      color: AppColors.LIGHT_BLACK,
                    ),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.WHITE,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 1.0.w),
                  title: Text(
                    collegeName,
                    style: AppTextStyles.medium().copyWith(color: AppColors.WHITE),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        noteTitle,
                        style: AppTextStyles.small().copyWith(color: AppColors.WHITE),
                      ),
                      Text(
                        date,
                        style: AppTextStyles.small().copyWith(color: AppColors.WHITE),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondChild extends StatelessWidget {
  final String collegeName;
  final String date;
  final String noteTitle;
  final String subjectName;
  final String section;
  final ValueNotifier<bool> showMore;

  const SecondChild(
      {Key? key,
      required this.collegeName,
      required this.date,
      required this.noteTitle,
      required this.subjectName,
      required this.section,
      required this.showMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMore.value = false,
      child: Container(
        width: 100.0.w,
        //height: double.maxFinite,
        alignment: Alignment.center,
        // decoration: BoxDecoration(boxShadow: [AppStyles.darkBoxShadow]),
        margin: EdgeInsets.only(bottom: 2.5.w),
        child: Center(
          child: Container(
            //   height: 30.0.h,
            width: 100.0.w,
            margin: EdgeInsets.symmetric(
              vertical: 5.0.sp,
              horizontal: 1.6.h,
            ),
            //  padding: EdgeInsets.symmetric(vertical: 10.0.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.PRIMARY,
                    boxShadow: [AppStyles.lightBoxShadow],
                    borderRadius: AppStyles.borderRadiusB,
                  ),
                  width: 100.0.w,
                  child: ListTile(
                    leading: CircleCard(
                      backgroundColor: AppColors.WHITE,
                      child: SvgPicture.asset(
                        Assets.svgBank,
                        color: AppColors.LIGHT_BLACK,
                      ),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: AppColors.WHITE,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.9.w, vertical: 0.0.w),
                    title: Text(
                      collegeName,
                      style: AppTextStyles.medium().copyWith(color: AppColors.WHITE),
                    ),
                    subtitle: Text(
                      date,
                      style: AppTextStyles.small().copyWith(color: AppColors.WHITE),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.0.sp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
                  child: Text(
                    subjectName,
                    style: AppTextStyles.medium(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                  child: Dash(
                    dashColor: AppColors.ACCENT,
                    length: 83.0.w,
                    dashLength: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
                  child: Text(
                    section,
                    style: AppTextStyles.medium(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                  child: Dash(
                    dashColor: AppColors.ACCENT,
                    length: 83.0.w,
                    dashLength: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
                  child: Text(
                    noteTitle,
                    style: AppTextStyles.medium(),
                  ),
                ),
                SizedBox(
                  height: 15.0.sp,
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.WHITE,
                boxShadow: [AppStyles.lightBoxShadow],
                borderRadius: AppStyles.borderRadiusB,
                border: Border.all(color: AppColors.PRIMARY, width: 1)),
          ),
        ),
      ),
    );
  }
}
