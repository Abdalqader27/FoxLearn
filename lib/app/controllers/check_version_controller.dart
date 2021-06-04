import 'package:foxlearn/app/infrastructure/repositories/settings_repository/settings_repository_impl.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:tuple/tuple.dart';

class CheckVersionController extends GetxController
    with StateMixin<Tuple2<bool, bool>> {
  final SettingsRepositoryImpl _settingsRepositoryImpl =
      SettingsRepositoryImpl();
  bool updateAvailable = false;
  bool isVersionSupported = true;

  @override
  void onInit() {
    _checkVersion();
    super.onInit();
  }

  _checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final result =
        await _settingsRepositoryImpl.checkAppVersion(packageInfo.version);
    result.maybeWhen(
        success: (appStatus) {
          appStatus.when(update: () {
            updateAvailable = true;
          }, supported: () {
            isVersionSupported = true;
          }, unSupported: () {
            isVersionSupported = false;
          });
        },
        orElse: () {});
    update();
    change(Tuple2(isVersionSupported, updateAvailable),
        status: RxStatus.success());
  }

  skip() {
    isVersionSupported = true;
    change(Tuple2(isVersionSupported, false), status: RxStatus.success());
    update();
  }
}
