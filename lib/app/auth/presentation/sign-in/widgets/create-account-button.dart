import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';

class CreateAccountButton extends StatelessWidget {
  final onTap;

  const CreateAccountButton({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            'إنشاء حساب جديد',
            style: AppTextStyles.medium()
                .copyWith(color: AppColors.WHITE, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
