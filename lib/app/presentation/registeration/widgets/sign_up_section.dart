import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/forms_edit_controllers.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpSection extends StatefulWidget {
  final enterButton;
  final controller;

  SignUpSection({
    Key? key,
    this.enterButton,
    this.controller,
  }) : super(key: key);

  @override
  _SignUpSectionState createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  Icon iconPassword = Icon(
    Icons.visibility_off,
    color: AppColors.grey,
    size: 14.0.sp,
  );
  bool see = true;

  onEye() {
    setState(() {
      if (see) {
        iconPassword = Icon(
          Icons.visibility,
          color: AppColors.thirdColor,
          size: 14.0.sp,
        );
        see = false;
      } else {
        see = true;
        iconPassword = Icon(
          Icons.visibility_off,
          color: AppColors.grey,
          size: 14.0.sp,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = getEditTexts(context, widget.controller, iconPassword, onEye, see);

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: items.length + 1,
      padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.w),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return index < items.length
            ? items[index]
            : Center(
                child: widget.enterButton,
              );
      },
      separatorBuilder: (context, index) => SizedBox(height: 3.0.h),
    );
  }
}
