import 'package:get/get.dart';

class IntroController extends GetxController {
  var indexPage = 0.obs;

  setPageIndex(int index) {
    indexPage(index);
    update();
  }
}
