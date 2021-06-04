import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/generated/assets.dart';

import 'intro_template.dart';

final List<IntroTemplate> introItem = [
  IntroTemplate(
      id: 0,
      title: " العروض",
      subtitle:
          "نضمن لك تجربة مرنة للاطلاع على أحدث الحسومات والعروض المُقدمة على المواد   ",
      image: SvgPicture.asset(Assets.svgIntro1)),
  IntroTemplate(
      id: 1,
      title: "ميزة الإشعارات",
      subtitle:
          "توفر لك وصول أفضل لمجال عملك بوسطة إشعارات نصية  بطريقة مريحة وتفاعلية   ",
      image: SvgPicture.asset(Assets.svgIntro2)),
  IntroTemplate(
      id: 2,
      title: " ميزة الجلسات الإمتحانية ",
      subtitle:
          " نتيح لك الفرصة للاطلاع على الجلسات الإمتحانية المتوفرة للمواد ",
      image: SvgPicture.asset(Assets.svgIntro3)),
  IntroTemplate(
      id: 3,
      title: "ميزة الإعلانات",
      subtitle: "نتيح لك الفرصة لمتابعة أهم الإعلانات الرائجة في الأسواق  ",
      image: SvgPicture.asset(Assets.svgIntro4))
];
