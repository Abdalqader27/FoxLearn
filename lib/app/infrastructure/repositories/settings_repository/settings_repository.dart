


import 'package:foxlearn/app/infrastructure/models/app_status/app_status.dart';

import '../repository_result.dart';

abstract class SettingsRepository {
  Future<RepoResult<AppStatus>> checkAppVersion(String appVersion);
  Future<RepoResult<bool>> iosState();
}
