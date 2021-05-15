import 'package:catcher/core/catcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/applications.dart';
import 'package:foxlearn/app/controllers/app_controller/app_state.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'package:moor_inspector/moor_inspector.dart';

import 'app/controllers/app_controller/app_controller.dart';
import 'common/exceptions/error_handling/catcher_config.dart';
import 'injections/_injections.dart' as di;

/// ------------------------------------------------------------
/// To Catcher and GET State management
void main() async {
  /// ------------------- Initialization App Sections  ---------------------------///
  /// Init your storage
  await di.init();

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  final _init = Firebase.initializeApp();

  /// init build
  dynamic init() => FutureBuilder<FirebaseApp>(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Get.put<AppController>(
                AppController(context, AppState.loading().obs));
            return Application();
          } else {

            return CircularProgressIndicator();
          }
        },
      );

  /// ----------------------  Catcher Sections -------------------------------------///
  /// hi bood we commit this for you :-)
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

    ///Run App is not exist because i have use the catcher library {
    runApp(
      FutureBuilder<FirebaseApp>(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) return init();
          return Container();
        },
      ),
    );
}
