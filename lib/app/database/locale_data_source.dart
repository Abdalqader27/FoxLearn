import 'dart:convert';

import 'package:foxlearn/app/infrastructure/models/user_data.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get_storage/get_storage.dart';

import 'app_db.dart';

class LocalDataSource {
  static late AppDatabase appDatabase;

  static init() {
    appDatabase = AppDatabase();
  }

  static UserAccount? get user {
    final data = GetStorage().read(AppKeys.USER_FLAG_KEY);
    if (data == null) return null;
    final jsonData = json.decode(data);
    return UserAccount.fromJson(jsonData);
  }
}
