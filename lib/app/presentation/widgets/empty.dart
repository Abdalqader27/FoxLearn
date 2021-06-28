import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyWidget extends StatelessWidget {
  final String? text;
  final bool type2;

  const EmptyWidget({Key? key, this.text, this.type2 = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(!type2 ? Assets.svgFox : Assets.svgFox, width: 70.0.w),
        SizedBox(height: 16),
        Text(text!, textAlign: TextAlign.center, style: AppTextStyles.medium()),
      ],
    );
  }
}
