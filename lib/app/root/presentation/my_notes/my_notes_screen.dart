import 'package:flutter/material.dart';
import 'package:foxlearn/common/widgets/circle-card.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'components/note_card.dart';

class MyNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //  padding: EdgeInsets.only(top: 15.0.h, left: 7.0.w, right: 7.0.w),
      // physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 2.0.h,
        ),
        Center(
            child: CircleCard(
          backgroundColor: AppColors.WHITE,
          showBorder: true,
          showShadow: false,
          borderColor: AppColors.PRIMARY,
          child: Center(
            child: Text(
              "1",
              style: AppTextStyles.medium(fontWeight: FontWeight.bold),
            ),
          ),
        )),
        SizedBox(
          height: 3.0.h,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 2.0.h),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NoteCard();
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
