import 'package:get/get.dart';

class IntroController extends GetxController with StateMixin<int> {
  int indexPage = 0;

  @override
  void onInit() {
    super.onInit();
    change(indexPage, status: RxStatus.success());
  }

  void changePage(index) => change((indexPage = index), status: RxStatus.success());
}
