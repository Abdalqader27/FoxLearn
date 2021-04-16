import 'package:catcher/catcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/tools/services/error_handling/catcher-config.dart';
import 'package:foxlearn/views/appliction.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// CREATED BY ABD ALQADER ALNAJJAR 2021 / 4 / 9
/// To Catcher and GET State management

void main() async {
  /// ------------------- Initialization App Sections  ---------------------------///
  bool screenInit = false;
  await GetStorage.init();

  /// init build
  dynamic init() => LayoutBuilder(
        builder: (_, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            return ResponsiveSizer(builder: (context, orientation, screenType) {
              return Application();
            });
          });
        },
      );

  /// ----------------------  Catcher Sections -------------------------------------///
  Catcher(
      rootWidget: init(),
      // debugConfig: CatcherConfig.getDebugConfig(),
      releaseConfig: CatcherConfig.getReleaseConfig(),
      profileConfig: CatcherConfig.getProfileConfig(),
      enableLogger: true,
      ensureInitialized: true,
      runAppFunction: () => init());
}
