import 'package:flutter/cupertino.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'common_seasons_shape.dart';

class CommonSessionItem extends StatelessWidget {
  final date;
  final category;
  final university;
  final count;
  final VoidCallback onTap;

  const CommonSessionItem(
      {Key? key, this.date, this.category, this.university, this.count, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 25.0.h,
          width: 60.0.w,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 0),
            painter: CommonSeasonsCustomPainter(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 6.0.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Text(
                    "$date",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.DARK_GREY2),
                  ),
                ),
                SizedBox(height: 35),
                itemText(university),
                itemText(category),
                itemText("${AppString.MATERIAL_COUNT} : $count "),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemText(data, {color}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Text(
          "$data ",
          textAlign: TextAlign.right,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: true,
          style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
