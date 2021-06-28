import 'package:catcher/core/catcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'package:moor_inspector/moor_inspector.dart';

import 'app/appliction.dart';
import 'app/controllers/app_controller/app_controller.dart';
import 'app/controllers/app_controller/app_state.dart';
import 'app/database/app_db.dart';
import 'app/database/locale_data_source.dart';
import 'common/exceptions/error_handling/catcher_config.dart';

final AppDatabase database = AppDatabase();

/// CREATED BY ABD ALQADER ALNAJJAR 2021 / 1 / 30
/// Update  BY ABD ALQADER ALNAJJAR 2021 / 3 / 3 USING LOVE OF GETX lib
/// ------------------------------------------------------------
/// To Catcher and GET State management
// welcome to null safety
void main() async {
  /// ------------------- Initialization App Sections  ---------------------------///
  /// Init your storage
  await GetStorage.init();
  LocalDataSource.init();
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) _initMoorInspector(LocalDataSource.appDatabase);
  //final _init = Firebase.initializeApp();
SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  /// init build
  dynamic init() {
    Get.put<AppController>(AppController(AppState.loggedIn().obs));
    return Application();
  }

  /// ----------------------  Catcher Sections -------------------------------------///
  /// hi bood we commit this for you :-)
  if (!kDebugMode && !kProfileMode)
    Catcher(
        rootWidget: init(),
        debugConfig: CatcherConfig.getDebugConfig(),
        releaseConfig: CatcherConfig.getReleaseConfig(),
        profileConfig: CatcherConfig.getProfileConfig(),
        enableLogger: true,
        ensureInitialized: true,
        runAppFunction: () => init());
  else

    ///Run App is not exist because i have use the catcher library {
    runApp(init());
}

Future<void> _initMoorInspector(AppDatabase appDatabase) async {
  final moorInspectorBuilder = MoorInspectorBuilder()
    ..bundleId = 'com.abdalqader27.foxlearn'
    ..icon = 'flutter'
    ..addDatabase('AppDatabase', appDatabase);
  final inspector = moorInspectorBuilder.build();
  await inspector.start();
}
