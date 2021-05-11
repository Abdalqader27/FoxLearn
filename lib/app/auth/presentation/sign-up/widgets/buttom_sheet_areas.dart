import 'package:flutter/material.dart';
import 'package:foxlearn/app/auth/infrastructure/data_sources/user_local_data_provider.dart';
import 'package:foxlearn/app/auth/presentation/sign-up/widgets/sgin_up_form.dart';
import 'package:foxlearn/common/widgets/rounded-buttom-sheet.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomSheetAreas extends StatefulWidget {
  final ValueNotifier<GenderCollege> selectedCollage;
  final TextEditingController collegeController;

  const BottomSheetAreas({Key? key, required this.selectedCollage, required this.collegeController})
      : super(key: key);

  @override
  _BottomSheetAreasState createState() => _BottomSheetAreasState();
}

class _BottomSheetAreasState extends State<BottomSheetAreas> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(unselectedWidgetColor: AppColors.ACCENT),
      child: Stack(
        children: <Widget>[
          Container(
            height: 70.0,
            width: double.infinity,
            color: Colors.black54,
          ),
          Container(
            height: 70.0,
            width: double.infinity,
            child: CustomPaint(
              painter: BottomSheetPainter(AppColors.WHITE),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            color: AppColors.WHITE,
            padding: EdgeInsets.only(left: 20.0.sp, right: 20.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Row(
                    children: [
                      Text(
                        "حدد الكلية",
                        style: AppTextStyles.title(fontWeight: FontWeight.bold)
                            .copyWith(color: AppColors.PRIMARY),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: serviceLocator<UserLocalDataProvider>().fakeCollege.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.ACCENT,
                          value:
                              index == widget.selectedCollage.value.selectedCollege ? true : false,
                          onChanged: (value) {
                            if (value!) {
                              widget.selectedCollage.value.selectedCollege = index;
                              widget.collegeController.text =
                                  serviceLocator<UserLocalDataProvider>().fakeCollege[index];
                            } else {
                              widget.selectedCollage.value.selectedCollege = -1;
                              widget.collegeController.text = "";
                            }
                            setState(() {});
                          },
                        ),
                        Text(
                          serviceLocator<UserLocalDataProvider>().fakeCollege[index],
                          style: AppTextStyles.medium(fontWeight: FontWeight.bold)
                              .copyWith(color: AppColors.LIGHT_BLACK),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
