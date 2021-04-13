import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class RoundedTextField extends StatefulWidget {
  final Object controller;
  final String hint;
  final Color color;
  final Color borderColor;
  final TextInputType textInputType;
  final Widget icon;
  final bool obscureText;
  final int index;
  final Function onTyping;
  final Function onTapIcon;
  final bool iconVisibility;

  RoundedTextField(
      {Key key,
      this.hint,
      this.color,
      this.borderColor,
      this.textInputType,
      this.icon,
      this.obscureText,
      this.index,
      this.controller,
      this.onTyping,
      this.onTapIcon,
      this.iconVisibility})
      : super(key: key);

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool isVisible;
  Widget icon;
  bool obscured;

  void changeVisibility(value) {
    setState(() {
      print('changeVisibility');
      isVisible = widget.onTyping(value);
    });
  }

  changeIcon() {
    setState(() {
      obscured = widget.onTapIcon();
      if (!obscured)
        icon = Icon(Icons.visibility);
      else
        icon = Icon(Icons.visibility_off);
    });
  }

  @override
  Widget build(BuildContext context) {
    icon ??= widget.icon;
    isVisible ??= widget.iconVisibility;
    obscured ??= widget.obscureText;

    return Container(
      margin: EdgeInsets.only(bottom: 1.0.h, top: 1.0.h),
      padding: EdgeInsets.all(10.0),
      height: 62,
      width: 350,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
          color: widget.color),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) => changeVisibility(value),
        obscureText: obscured,
        keyboardType: widget.textInputType,
        // style: kMiddleTextStyle,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            suffixIcon: Visibility(
              visible: isVisible,
              child: IconButton(icon: icon, onPressed: changeIcon),
            ),
     //         hintStyle: kMiddleTextStyle.copyWith(color: kGrey)
        ),
      ),
    );
  }
}
