import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LottieLoading extends StatelessWidget {
  final bool flexible;
  final bool expanded;

  const LottieLoading({Key? key, this.flexible = false, this.expanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lottie =
        Center(child: Lottie.asset("assets/lotti/loading.json", width: 30.0.h));
    if (expanded)
      return Expanded(child: lottie);
    else if (flexible) return Flexible(child: lottie);
    return lottie;
  }
}
