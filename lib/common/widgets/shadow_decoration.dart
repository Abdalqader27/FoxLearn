import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShadowDecoration extends StatelessWidget {
  final Widget child;
  final double? radius;
  const ShadowDecoration({Key? key, required this.child, this.radius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(radius ?? 4.0.w),
        boxShadow: [
          BoxShadow(
              color: theme.shadowColor.withOpacity(0.05),
              offset: Offset(2, 2),
              blurRadius: 15)
        ],
      ),
    );
  }
}
