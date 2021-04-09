
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

// fl-10
class CatcherConfig {
  static CatcherOptions getDebugConfig() {
    //debug configuration
    // String path = '/storage/emulated/0/log.txt';
    return CatcherOptions(
      DialogReportMode(), // Try it out DialogReportMode()
      [
        ConsoleHandler(enableApplicationParameters: true, enableDeviceParameters: true, enableCustomParameters: true, enableStackTrace: true),
        ToastHandler(
          gravity: ToastHandlerGravity.bottom,
          length: ToastHandlerLength.long,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          textSize: 12.0,
          customMessage: "We are sorry but unexpected error occurred.",
        ),
        // FileHandler(File(path), printLogs: true)
      ],
    );
  }

  static CatcherOptions getReleaseConfig() {
    //release configuration
    return CatcherOptions(
      DialogReportMode(),
      [
        EmailManualHandler(
          ["abdalqader27.najjar@gmail.com"],
          enableDeviceParameters: true,
          enableStackTrace: true,
          enableCustomParameters: true,
          enableApplicationParameters: true,
          sendHtml: true,
          emailTitle: "Error in App",
          emailHeader: "Error",
          printLogs: true,
        )
      ],
    );
  }

  static CatcherOptions getProfileConfig() {
    //profile configuration
    return CatcherOptions(
      PageReportMode(
        showStackTrace: false,
      ),
      [
        ConsoleHandler(),
        ToastHandler(
            gravity: ToastHandlerGravity.bottom,
            length: ToastHandlerLength.long,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            textSize: 12.0,
            customMessage: "We are sorry but unexpected error occurred.")
      ],
      handlerTimeout: 10000,
    );
  }
}
