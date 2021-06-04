
import 'package:foxlearn/common/api_tools/api_result.dart';

abstract class ApiSettingsServices {
  Future<ApiResult<int>> checkAppVersion(String appVersion);
  Future<ApiResult<bool>> iosState();
}
