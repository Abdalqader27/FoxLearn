import 'package:flutter/material.dart';

class Screen {
  static Size size;

  static double height(double height) {
    double p = height / 800 * 100;
    return size.height * p / 100;
  }

  static double width(double width) {
    double p = width / 400 * 100;
    return size.width * p / 100;
  }
}
