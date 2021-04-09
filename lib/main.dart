import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/views/appliction.dart';

/// CREATED BY ABD ALQADER ALNAJJAR 2021 / 4 / 9

/// ------------------------------------------------------------
/// To Catcher and GET State management

void main() async {
  /// ------------------- Initialization App Sections  ---------------------------///
  bool screenInit = false;
  await GetStorage.init();
  /// init build
  dynamic init() => LayoutBuilder(
        builder: (_, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            if (!screenInit) {
              SizerUtil().init(constraints, orientation);
              screenInit = false;
            } //initialize SizerUtil
            return Application();
          });
        },
      );

  /// ----------------------  Catcher Sections -------------------------------------///
  if (!kDebugMode)
    Catcher(
        rootWidget: init(),
        debugConfig: CatcherConfig.getDebugConfig(),
        releaseConfig: CatcherConfig.getReleaseConfig(),
        profileConfig: CatcherConfig.getProfileConfig(),
        enableLogger: true,
        ensureInitialized: true,
        runAppFunction: () => init());
  else

    ///Run App is not exist because i have use the catcher library
    runApp(DevicePreview(
      builder: (_) => init(),
      enabled: true,
    ));
}