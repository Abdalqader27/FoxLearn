import 'dart:io';

import 'package:foxlearn/common/api_tools/api_result.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';

import '../dio_client_mixin.dart';
import 'api_settings_services.dart';

class ApiSettings with DioClientMixin implements ApiSettingsServices {
  @override
  Future<ApiResult<int>> checkAppVersion(String appVersion) async {
    print(appVersion);
    try {
      final response = await dioClient.get(ApiRoutes.CHECK_APP_VERSION,
          queryParameters: {"CurrentAppVersion": appVersion});
      print(response);
      return ApiResult.success(data: response as int);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<bool>> iosState() async {
    if (Platform.isAndroid) return ApiResult.success(data: true);
    try {
      final response = await dioClient.get(ApiRoutes.IOS_STATE);
      return ApiResult.success(data: response['isDone'] as bool);
    } catch (e) {
      print(e);
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
}
