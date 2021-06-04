import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';


class IntroStyle {
  Widget topDownStyle(title, subtitle, image) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Container(
                      child: Text(title, style: AppTextStyles.title())),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(subtitle, style: AppTextStyles.medium()))
                ]))),
        Expanded(flex: 3, child: Container(child: Center(child: image))),
      ],
    );
  }

  Widget downTopStyle(title, subtitle, image) {
    return Column(
      children: <Widget>[
        Expanded(flex: 3, child: Container(child: Center(child: image))),
        Expanded(
            flex: 2,
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Container(
                      child: Text(title, style: AppTextStyles.title())),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        subtitle,
                        style: AppTextStyles.medium(),
                      )),
                ]))),
      ],
    );
  }
}
