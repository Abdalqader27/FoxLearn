
import 'package:foxlearn/app/controllers/root_controller.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut((() => RootController()));
  }
}
