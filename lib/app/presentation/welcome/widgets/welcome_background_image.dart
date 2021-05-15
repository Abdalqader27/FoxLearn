import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundImage{
  Widget imageBackground()=>  Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SvgPicture.asset("assets/svg/fox_group.svg"));
}