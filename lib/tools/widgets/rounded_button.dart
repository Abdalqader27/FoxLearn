import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class RoundedButton extends StatelessWidget {
  final Color color;
  final Widget myChild;
  final Function onTap;
  final Color borderColor;

  const RoundedButton({Key key, this.color, this.myChild, this.onTap, this.borderColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.5,color: borderColor),
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          height: 8.0.h,
          width: 85.0.w,
          alignment: Alignment.center,
          child: myChild,
        ),
      ),
    );
  }
}
