import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'injections/_injections.dart' as di;
import 'my_app.dart';

/// -> App Has Created At 2021 / 5 / 6

Future<void> main() async {
  ///initialize dependencies injections
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  final _init = Firebase.initializeApp();
  await GetStorage.init();
  runApp(FutureBuilder<FirebaseApp>(
    future: _init,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return MyApp();
      }
      return Container();
    },
  ));
}
