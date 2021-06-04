import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/presentation/on_boarding/components/intro_style.dart';

class IntroTemplate extends StatelessWidget with IntroStyle {
  final String title;
  final String subtitle;
  final SvgPicture image;
  final int? id;

  IntroTemplate({required this.title, required this.subtitle, required this.image, this.id});
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all((50)),
        child: id! % 2 == 0
            ? topDownStyle(title, subtitle, image)
            : downTopStyle(title, subtitle, image),
      );
}
