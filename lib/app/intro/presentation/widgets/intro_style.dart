import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  Container(child: Text(title)),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(subtitle, style: AppTextStyles.medium()))
                ]))),
        Expanded(flex: 3, child: Card(elevation: 0, child: Center(child: SvgPicture.asset(image)))),
      ],
    );
  }

  Widget downTopStyle(title, subtitle, image) {
    return Column(
      children: <Widget>[
        Expanded(flex: 3, child: Card(elevation: 0, child: Center(child: SvgPicture.asset(image)))),
        Expanded(
            flex: 2,
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Container(child: Text(title, style: AppTextStyles.medium())),
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

  Widget style3({index, title, subtitle, image, context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        index == 1 ? _displayText(title, subtitle) : _displayImage(image, context),
        SizedBox(
          height: 25,
        ),
        index == 1 ? _displayImage(image, context) : _displayText(title, subtitle),
      ],
    );
  }

  _displayText(String text, subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.5,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _displayImage(String path, context) {
    return SvgPicture.asset(
      path,
      height: MediaQuery.of(context).size.height * .35,
      width: MediaQuery.of(context).size.height * .25,
    );
  }
}
