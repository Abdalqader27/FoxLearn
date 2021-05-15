import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/app/presentation/welcome/sgin_in/widgets/call-dialog-function.dart';
import 'package:foxlearn/common/widgets/circle-card.dart';
import 'package:foxlearn/common/widgets/flutter_dash.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerComponent {
  List<Widget> getItems(context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(vertical: 2.0.h),
        height: 20.0.w,
        width: 15.0.w,
        child: DrawerHeader(
            child: GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 2.0.h),
                padding: EdgeInsets.all(5.0.sp),
                child: SvgPicture.asset(
                  Assets.svgProfile,
                  height: 13.0.w,
                  width: 13.0.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.WHITE,
                  boxShadow: [AppStyles.lightBoxShadow],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgBank),
          backgroundColor: AppColors.PRIMARY,
        ),
        title: Text("sxsx"),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgActiveCode),
          backgroundColor: AppColors.PRIMARY,
        ),
        title: Text("تفعيل الكود"),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgManageCode),
          backgroundColor: AppColors.PRIMARY,
        ),
        title: Text("إدارة الأكواد"),
      ),
      ExpansionTileCard(
        borderRadius: AppStyles.borderRadiusAll(15),
        elevation: 0,
        expandedColor: AppColors.CARD_COLOR,
        expandedTextColor: AppColors.LIGHT_BLACK,
        contentPadding: EdgeInsets.only(left: 10),
        title: ListTile(
          leading: CircleCard(
            child: SvgPicture.asset(Assets.svgCalling),
            backgroundColor: AppColors.PRIMARY,
          ),
          title: Text("تواصل معنا"),
        ),
        children: [
          ListTile(
            leading: CircleCard(
              child: SvgPicture.asset(Assets.svgScan),
              backgroundColor: AppColors.RED,
            ),
            title: Text("خطوات التفعيل"),
          ),
          ListTile(
            leading: CircleCard(
              child: SvgPicture.asset(Assets.svgUStore),
              backgroundColor: AppColors.RED,
            ),
            title: Text("نقاط البيع"),
          ),
          ListTile(
            leading: CircleCard(
              child: SvgPicture.asset(Assets.svgUComment),
              backgroundColor: AppColors.RED,
            ),
            title: Text("راسلنا"),
          ),
          ListTile(
            leading: CircleCard(
              child: SvgPicture.asset(Assets.svgUTelegram),
              backgroundColor: AppColors.RED,
            ),
            title: Text("بوت الدعم الفني"),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0.sp),
        child: Dash(
          dashThickness: 1,
          dashLength: 10,
          dashColor: AppColors.ACCENT,
          length: 70.0.w,
        ),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgSetting),
          backgroundColor: AppColors.ACCENT,
        ),
        title: Text("الإعدادات"),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgMoon),
          backgroundColor: AppColors.ACCENT,
        ),
        title: Text("sxsx"),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgGoogle),
          backgroundColor: AppColors.ACCENT,
        ),
        title: Text("تحديث التطبيق"),
        onTap: () => callDialog(context),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgDropbox),
          backgroundColor: AppColors.ACCENT,
        ),
        title: Text("ما الجديد في النسخة"),
      ),
      ListTile(
        leading: CircleCard(
          child: SvgPicture.asset(Assets.svgNetwork),
          backgroundColor: AppColors.ACCENT,
        ),
        title: Text("sxsx"),
      ),
    ];
  }
}
