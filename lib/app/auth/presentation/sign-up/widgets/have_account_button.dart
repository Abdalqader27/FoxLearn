import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';

class HaveAccountButton extends StatelessWidget {
  final onTap;

  const HaveAccountButton({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            'لدي حساب بالفعل.. تسجيل الدخول',
            style: AppTextStyles.medium()
                .copyWith(color: AppColors.PRIMARY, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
