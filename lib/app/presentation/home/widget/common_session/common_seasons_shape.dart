import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonSeasonsCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9189189, size.height * 0.2441860);
    path_0.cubicTo(size.width * 0.9189189, size.height * 0.1799669, size.width * 0.8705189,
        size.height * 0.1279070, size.width * 0.8108108, size.height * 0.1279070);
    path_0.lineTo(size.width * 0.3243243, size.height * 0.1279070);
    path_0.cubicTo(size.width * 0.1452049, size.height * 0.1279070, 0, size.height * 0.2840866, 0,
        size.height * 0.4767442);
    path_0.lineTo(0, size.height * 0.8837209);
    path_0.cubicTo(0, size.height * 0.9479419, size.width * 0.04840168, size.height,
        size.width * 0.1081081, size.height);
    path_0.lineTo(size.width * 0.8108108, size.height);
    path_0.cubicTo(size.width * 0.8705189, size.height, size.width * 0.9189189,
        size.height * 0.9479419, size.width * 0.9189189, size.height * 0.8837209);
    path_0.lineTo(size.width * 0.9189189, size.height * 0.2441860);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffF6F6F6).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.8054054, size.height * 0.2093023),
        size.width * 0.1945946, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5189189, size.height * 0.1250000);
    path_2.cubicTo(size.width * 0.5989189, size.height * 0.1389535, size.width * 0.6117135,
        size.height * 0.2141471, size.width * 0.6081081, size.height * 0.2500000);
    path_2.lineTo(size.width * 0.6432432, size.height * 0.1250000);
    path_2.lineTo(size.width * 0.5189189, size.height * 0.1250000);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.8135135, size.height * 0.4186047);
    path_3.cubicTo(size.width * 0.8935135, size.height * 0.4325581, size.width * 0.9216216,
        size.height * 0.4418605, size.width * 0.9216216, size.height * 0.5406977);
    path_3.lineTo(size.width * 0.9216216, size.height * 0.3430233);
    path_3.lineTo(size.width * 0.8135135, size.height * 0.4186047);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.8011243, size.height * 0.3521779);
    path_4.cubicTo(size.width * 0.7641243, size.height * 0.3518640, size.width * 0.7275838,
        size.height * 0.3415378, size.width * 0.6938703, size.height * 0.3218657);
    path_4.cubicTo(size.width * 0.6918595, size.height * 0.3207110, size.width * 0.6901568,
        size.height * 0.3188285, size.width * 0.6889676, size.height * 0.3164471);
    path_4.cubicTo(size.width * 0.6877730, size.height * 0.3140657, size.width * 0.6871405,
        size.height * 0.3112884, size.width * 0.6871514, size.height * 0.3084529);
    path_4.lineTo(size.width * 0.6871514, size.height * 0.1894320);
    path_4.cubicTo(size.width * 0.6871568, size.height * 0.1855331, size.width * 0.6883568,
        size.height * 0.1817948, size.width * 0.6904919, size.height * 0.1790372);
    path_4.cubicTo(size.width * 0.6926324, size.height * 0.1762802, size.width * 0.6955297,
        size.height * 0.1747297, size.width * 0.6985514, size.height * 0.1747250);
    path_4.lineTo(size.width * 0.9037027, size.height * 0.1747250);
    path_4.cubicTo(size.width * 0.9067243, size.height * 0.1747297, size.width * 0.9096216,
        size.height * 0.1762802, size.width * 0.9117568, size.height * 0.1790378);
    path_4.cubicTo(size.width * 0.9138919, size.height * 0.1817948, size.width * 0.9150919,
        size.height * 0.1855331, size.width * 0.9150973, size.height * 0.1894320);
    path_4.lineTo(size.width * 0.9150973, size.height * 0.3084529);
    path_4.cubicTo(size.width * 0.9151081, size.height * 0.3112884, size.width * 0.9144757,
        size.height * 0.3140657, size.width * 0.9132865, size.height * 0.3164471);
    path_4.cubicTo(size.width * 0.9120919, size.height * 0.3188291, size.width * 0.9103892,
        size.height * 0.3207116, size.width * 0.9083838, size.height * 0.3218657);
    path_4.cubicTo(size.width * 0.8746649, size.height * 0.3415378, size.width * 0.8381243,
        size.height * 0.3518645, size.width * 0.8011243, size.height * 0.3521779);
    path_4.lineTo(size.width * 0.8011243, size.height * 0.3521779);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xff7367F0).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.8011027, size.height * 0.2557535);
    path_5.cubicTo(size.width * 0.7995838, size.height * 0.2557552, size.width * 0.7980811,
        size.height * 0.2553645, size.width * 0.7966757, size.height * 0.2546047);
    path_5.lineTo(size.width * 0.6339946, size.height * 0.1660378);
    path_5.cubicTo(size.width * 0.6318973, size.height * 0.1648959, size.width * 0.6301135,
        size.height * 0.1629692, size.width * 0.6288703, size.height * 0.1605058);
    path_5.cubicTo(size.width * 0.6276270, size.height * 0.1580430, size.width * 0.6269892,
        size.height * 0.1551564, size.width * 0.6270270, size.height * 0.1522192);
    path_5.cubicTo(size.width * 0.6270703, size.height * 0.1492814, size.width * 0.6277946,
        size.height * 0.1464273, size.width * 0.6291027, size.height * 0.1440244);
    path_5.cubicTo(size.width * 0.6304162, size.height * 0.1416215, size.width * 0.6322541,
        size.height * 0.1397808, size.width * 0.6343838, size.height * 0.1387384);
    path_5.lineTo(size.width * 0.7970649, size.height * 0.05910000);
    path_5.cubicTo(size.width * 0.7996865, size.height * 0.05781163, size.width * 0.8025838,
        size.height * 0.05781959, size.width * 0.8052000, size.height * 0.05912267);
    path_5.lineTo(size.width * 0.9657027, size.height * 0.1387605);
    path_5.cubicTo(size.width * 0.9678216, size.height * 0.1398110, size.width * 0.9696486,
        size.height * 0.1416529, size.width * 0.9709459, size.height * 0.1440500);
    path_5.cubicTo(size.width * 0.9722486, size.height * 0.1464465, size.width * 0.9729676,
        size.height * 0.1492901, size.width * 0.9730108, size.height * 0.1522163);
    path_5.cubicTo(size.width * 0.9730486, size.height * 0.1551424, size.width * 0.9724162,
        size.height * 0.1580180, size.width * 0.9711838, size.height * 0.1604750);
    path_5.cubicTo(size.width * 0.9699514, size.height * 0.1629326, size.width * 0.9681784,
        size.height * 0.1648599, size.width * 0.9660919, size.height * 0.1660105);
    path_5.lineTo(size.width * 0.8055892, size.height * 0.2545756);
    path_5.cubicTo(size.width * 0.8041730, size.height * 0.2553547, size.width * 0.8026432,
        size.height * 0.2557552, size.width * 0.8011027, size.height * 0.2557535);
    path_5.lineTo(size.width * 0.8011027, size.height * 0.2557535);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xff7367F0).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.7061514, size.height * 0.3299669);
    path_6.cubicTo(size.width * 0.7145405, size.height * 0.3299669, size.width * 0.7213459,
        size.height * 0.3211878, size.width * 0.7213459, size.height * 0.3103581);
    path_6.cubicTo(size.width * 0.7213459, size.height * 0.2995279, size.width * 0.7145405,
        size.height * 0.2907488, size.width * 0.7061514, size.height * 0.2907488);
    path_6.cubicTo(size.width * 0.6977568, size.height * 0.2907488, size.width * 0.6909514,
        size.height * 0.2995279, size.width * 0.6909514, size.height * 0.3103581);
    path_6.cubicTo(size.width * 0.6909514, size.height * 0.3211878, size.width * 0.6977568,
        size.height * 0.3299669, size.width * 0.7061514, size.height * 0.3299669);
    path_6.close();

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xff3F3D56).withOpacity(1.0);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.9666703, size.height * 0.1534401);
    path_7.lineTo(size.width * 0.8061622, size.height * 0.2420058);
    path_7.cubicTo(size.width * 0.8049081, size.height * 0.2426959, size.width * 0.8035622,
        size.height * 0.2430541, size.width * 0.8022054, size.height * 0.2430581);
    path_7.cubicTo(size.width * 0.8008432, size.height * 0.2430628, size.width * 0.7994919,
        size.height * 0.2427128, size.width * 0.7982378, size.height * 0.2420302);
    path_7.lineTo(size.width * 0.6355568, size.height * 0.1534663);
    path_7.cubicTo(size.width * 0.6335135, size.height * 0.1523808, size.width * 0.6318108,
        size.height * 0.1504471, size.width * 0.6307135, size.height * 0.1479721);
    path_7.cubicTo(size.width * 0.6299946, size.height * 0.1495773, size.width * 0.6295514,
        size.height * 0.1513610, size.width * 0.6294108, size.height * 0.1532047);
    path_7.cubicTo(size.width * 0.6292703, size.height * 0.1550483, size.width * 0.6294324,
        size.height * 0.1569099, size.width * 0.6298919, size.height * 0.1586663);
    path_7.cubicTo(size.width * 0.6303459, size.height * 0.1604221, size.width * 0.6310919,
        size.height * 0.1620320, size.width * 0.6320649, size.height * 0.1633895);
    path_7.cubicTo(size.width * 0.6330432, size.height * 0.1647471, size.width * 0.6342324,
        size.height * 0.1658203, size.width * 0.6355568, size.height * 0.1665390);
    path_7.lineTo(size.width * 0.7982378, size.height * 0.2551029);
    path_7.cubicTo(size.width * 0.7994919, size.height * 0.2557855, size.width * 0.8008432,
        size.height * 0.2561355, size.width * 0.8022054, size.height * 0.2561308);
    path_7.cubicTo(size.width * 0.8035622, size.height * 0.2561267, size.width * 0.8049081,
        size.height * 0.2557686, size.width * 0.8061622, size.height * 0.2550785);
    path_7.lineTo(size.width * 0.9666703, size.height * 0.1665128);
    path_7.cubicTo(size.width * 0.9679838, size.height * 0.1657884, size.width * 0.9691676,
        size.height * 0.1647116, size.width * 0.9701405, size.height * 0.1633535);
    path_7.cubicTo(size.width * 0.9711081, size.height * 0.1619953, size.width * 0.9718432,
        size.height * 0.1603872, size.width * 0.9722973, size.height * 0.1586349);
    path_7.cubicTo(size.width * 0.9727514, size.height * 0.1568826, size.width * 0.9729135,
        size.height * 0.1550262, size.width * 0.9727676, size.height * 0.1531884);
    path_7.cubicTo(size.width * 0.9726270, size.height * 0.1513500, size.width * 0.9721838,
        size.height * 0.1495721, size.width * 0.9714649, size.height * 0.1479721);
    path_7.cubicTo(size.width * 0.9703784, size.height * 0.1504273, size.width * 0.9686919,
        size.height * 0.1523500, size.width * 0.9666703, size.height * 0.1534401);
    path_7.lineTo(size.width * 0.9666703, size.height * 0.1534401);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_7, paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.7074324, size.height * 0.3102744);
    path_8.cubicTo(size.width * 0.7081027, size.height * 0.3102744, size.width * 0.7087459,
        size.height * 0.3099302, size.width * 0.7092216, size.height * 0.3093174);
    path_8.cubicTo(size.width * 0.7096973, size.height * 0.3087047, size.width * 0.7099622,
        size.height * 0.3078733, size.width * 0.7099622, size.height * 0.3070064);
    path_8.lineTo(size.width * 0.7099622, size.height * 0.1976483);
    path_8.lineTo(size.width * 0.7934973, size.height * 0.1583802);
    path_8.cubicTo(size.width * 0.7941676, size.height * 0.1583936, size.width * 0.7948162,
        size.height * 0.1580616, size.width * 0.7952973, size.height * 0.1574576);
    path_8.cubicTo(size.width * 0.7957784, size.height * 0.1568541, size.width * 0.7960595,
        size.height * 0.1560279, size.width * 0.7960649, size.height * 0.1551610);
    path_8.cubicTo(size.width * 0.7960757, size.height * 0.1542942, size.width * 0.7958216,
        size.height * 0.1534576, size.width * 0.7953514, size.height * 0.1528355);
    path_8.cubicTo(size.width * 0.7948865, size.height * 0.1522140, size.width * 0.7942432,
        size.height * 0.1518570, size.width * 0.7935730, size.height * 0.1518442);
    path_8.lineTo(size.width * 0.7100378, size.height * 0.1911116);
    path_8.cubicTo(size.width * 0.7093676, size.height * 0.1910919, size.width * 0.7086973,
        size.height * 0.1912483, size.width * 0.7080757, size.height * 0.1915715);
    path_8.cubicTo(size.width * 0.7074486, size.height * 0.1918942, size.width * 0.7068865,
        size.height * 0.1923779, size.width * 0.7064108, size.height * 0.1929919);
    path_8.cubicTo(size.width * 0.7059297, size.height * 0.1935983, size.width * 0.7055459,
        size.height * 0.1943227, size.width * 0.7052865, size.height * 0.1951227);
    path_8.cubicTo(size.width * 0.7050270, size.height * 0.1959227, size.width * 0.7048973,
        size.height * 0.1967814, size.width * 0.7048973, size.height * 0.1976483);
    path_8.lineTo(size.width * 0.7048973, size.height * 0.3070064);
    path_8.cubicTo(size.width * 0.7048973, size.height * 0.3078733, size.width * 0.7051676,
        size.height * 0.3087047, size.width * 0.7056378, size.height * 0.3093174);
    path_8.cubicTo(size.width * 0.7061135, size.height * 0.3099302, size.width * 0.7067622,
        size.height * 0.3102744, size.width * 0.7074324, size.height * 0.3102744);
    path_8.lineTo(size.width * 0.7074324, size.height * 0.3102744);
    path_8.close();

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Color(0xff3F3D56).withOpacity(1.0);
    canvas.drawPath(path_8, paint_8_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
