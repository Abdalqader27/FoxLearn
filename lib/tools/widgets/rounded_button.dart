import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class RoundedButton extends StatelessWidget {
  final Color color;
  final Widget myChild;
  final Function onTap;
  final Color borderColor;

  const RoundedButton({Key key, this.color, this.myChild, this.onTap, this.borderColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 1.0.h,bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.5,color: borderColor),
              borderRadius: BorderRadius.circular(30),
              color: color,
            ),
            height: 6.0.h,
            width: 85.0.w,
            alignment: Alignment.center,
            child: myChild,
          ),
        ),
      ),
    );
  }
}
