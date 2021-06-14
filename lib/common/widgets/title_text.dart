import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const TitleText(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      required this.color,
      this.fontWeight = FontWeight.w800})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'sst-arabic',

      ),
      textAlign: TextAlign.right,
    );
  }
}
