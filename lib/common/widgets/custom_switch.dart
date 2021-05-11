import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const CustomSwitch(
      {Key? key, required this.value, required this.onChanged, required this.activeColor})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Container(
            width: 9.0.w,
            height: 4.5.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? AppColors.DARK_GREY
                    : widget.activeColor),
            child: Padding(
              padding: EdgeInsets.only(top: 0.0, bottom: 0.0, right: 0, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // _circleAnimation.value == Alignment.centerRight
                  //     ? Container(
                  //         width: 4.0.w,
                  //       )
                  //     : Container(),
                  Expanded(
                    child: Align(
                      alignment: _circleAnimation.value,
                      child: Container(
                        width: 5.0.w,
                        height: 5.0.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                  ),
                  // _circleAnimation.value == Alignment.centerLeft
                  //     ? Container(
                  //         width: 4.0.w,
                  //       )
                  //     : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
