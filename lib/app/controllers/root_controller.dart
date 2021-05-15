import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  var indexPage = 0.obs;

  setIndexPage(int index) {
    indexPage(index);
    pageController.jumpToPage(index);
    update();
  }
}
