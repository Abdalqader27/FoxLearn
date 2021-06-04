import 'package:foxlearn/app/api/api.dart';
import 'package:foxlearn/app/api/settings/api_settings.dart';
import 'package:foxlearn/app/infrastructure/models/app_status/app_status.dart';
import 'package:foxlearn/app/infrastructure/repositories/settings_repository/settings_repository.dart';
import 'package:foxlearn/common/platform/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../repository_result.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final ApiSettings _api = ApiRepository.apiSettings;
  final NetworkInfoImpl _networkInfoImpl =
      NetworkInfoImpl(InternetConnectionChecker());

  @override
  Future<RepoResult<AppStatus>> checkAppVersion(String appVersion) async {
    late RepoResult<AppStatus> repoResult;
    if (await _networkInfoImpl.isConnected) {
      final result = await _api.checkAppVersion(appVersion);
      result.when(success: (data) {
        switch (data) {
          case 1:
            repoResult = RepoResult.success(data: AppStatus.unSupported());
            break;
          case 2:
            repoResult = RepoResult.success(data: AppStatus.update());
            break;
          default:
            repoResult = RepoResult.success(data: AppStatus.supported());
        }
      }, failure: (_) {
        repoResult = RepoResult.failure(data: AppStatus.supported());
      });
      return repoResult;
    } else {
      repoResult = RepoResult.failure(data: AppStatus.supported());

      return repoResult;
    }
  }

  @override
  Future<RepoResult<bool>> iosState() async {
    late RepoResult<bool> repoResult;

    if (await _networkInfoImpl.isConnected) {
      final result = await _api.iosState();
      result.when(success: (data) {
        repoResult = RepoResult.success(data: data);
      }, failure: (_) {
        repoResult = RepoResult.success(data: true);
      });

      return repoResult;
    } else {
      repoResult = RepoResult.success(data: true);

      return repoResult;
    }
  }
}
