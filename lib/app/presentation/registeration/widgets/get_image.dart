import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/common/widgets/progress_Indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetTopImage extends StatelessWidget {
  final path;

  const GetTopImage({Key? key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 3.0.h),
        SvgPicture.asset(
          path,
          height: 30.0.h,
          allowDrawingOutsideViewBox: true,
          matchTextDirection: true,
          excludeFromSemantics: true,
          placeholderBuilder: (_) =>
              Container(height: 30.0.h, child: ProgressIndicatorLoading()),
        ),
        SizedBox(height: 4.0.h)
      ],
    );
  }
}
