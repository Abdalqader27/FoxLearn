import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'intro_style.dart';

class IntroTemplate extends StatelessWidget with IntroStyle {
  final String title;
  final String subtitle;
  final String image;
  final int? id;

  IntroTemplate({required this.title, required this.subtitle, required this.image, this.id});

  @override
  Widget build(BuildContext context) =>
      style3(index: id, image: image, title: title, context: context, subtitle: subtitle);
// Container(
//   padding: EdgeInsets.all((50)),
//   child: id! % 2 == 0
//       ? topDownStyle(title, subtitle, image)
//       : downTopStyle(title, subtitle, image),
// );

}
