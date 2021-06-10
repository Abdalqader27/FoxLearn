import 'dart:convert';

import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/infrastructure/models/user_data.dart';
import 'package:foxlearn/common/api_tools/api_result.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'api_user_services.dart';

class ApiUser extends GetConnect with ApiUserServices, DioClientMixin {
  /// -----------------------------------------------------------------------------------------------------
  Future<ApiResult<UserAccount>> signIn(
      String phoneNumber, String password) async {
    try {
      final response = await dioClient.post(ApiRoutes.SIGN_IN,
          data: {'userName': phoneNumber, 'password': password});
      UserAccount user = UserAccount.fromJson(response);
      return ApiResult.success(data: user);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
///------------------------------------------------------------------------------------------------------------
  Future<ApiResult<bool>> setDeviceToken(
      String deviceToken, int studentId) async {
    try {
      final response = await dioClient.post(ApiRoutes.SET_DEVICE_TOKEN,
          data: {'deviceToken': deviceToken, 'id': studentId}, auth: true);

      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<UserAccount>> signUp(UserAccount userData) async {
    try {
      print(userData.toJson());

      final response =
          await dioClient.post(ApiRoutes.SIGN_UP, data: userData.toJson());
      try {
        UserAccount user = UserAccount.fromJson(response);
        return ApiResult.success(data: user);
      } catch (e) {
        return ApiResult.failure(error: NetworkExceptions.isExist());
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<UserAccount>> updateStudent(UserAccount userData) async {
    try {
      print(userData.toJson());

      final response = await dioClient.post(ApiRoutes.UPDATE_STUDENT,
          data: userData.toJson(), auth: true);
      GetStorage().write(AppKeys.LOGIN_FLAG_KEY, true);
      GetStorage().write(AppKeys.USER_FLAG_KEY, json.encode(userData.toJson()));
      UserAccount user = UserAccount.fromJson(response);
      return ApiResult.success(data: user);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  ///used in point of sales screen
  // @override
  // Future<ApiResult<List<PointOfSale>>> getUsersWithType(int type) async {
  //   try {
  //     final response = await dioClient.get(ApiRoutes.GET_USERS,
  //         queryParameters: {'type': type}, auth: true);
  //     final List responseUsersList = response['users'];
  //     print("response $response");
  //     final List<PointOfSale> userList = [];
  //     responseUsersList.forEach((element) {
  //       final PointOfSale user = PointOfSale.fromJson(element);
  //       userList
  //           .add(user.copyWith(fullName: user.firstName + ' ' + user.lastName));
  //     });
  //     return ApiResult.success(data: userList);
  //   } catch (e) {
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
  //   }
  // }
  //
  // ///used in my Question screen
  // @override
  // Future<ApiResult<List<Question>>> getQuestions(int? userId) async {
  //   try {
  //     final List response = await (dioClient.get(
  //         ApiRoutes.GET_STUDENT_QUESTIONS,
  //         queryParameters: {'studentId': userId},
  //         auth: true));
  //     List<Question> questions = [];
  //     response
  //         .forEach((question) => questions.add(Question.fromJson(question)));
  //
  //     return ApiResult.success(data: questions);
  //   } catch (e) {
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
  //   }
  // }

  @override
  Future<ApiResult<bool?>> checkStudentSecurityStamp(
      String? phoneNumber, String? securityStamp) async {
    try {
      final response = await dioClient.get(
          ApiRoutes.CHECK_STUDENT_SECURITY_STAMP,
          auth: true,
          queryParameters: {
            'securityStamp': securityStamp,
            'phoneNumber': phoneNumber
          });
      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<UserAccount>> skipLogin() async {
    try {
      final response = await dioClient.get(ApiRoutes.GET_DEFAULT_USER);
      UserAccount user = UserAccount.fromJson(response);
      return ApiResult.success(data: user);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

  @override
  Future<ApiResult<bool?>> isUserBlocked(int? studentId) async {
    try {
      final response = await dioClient.get(ApiRoutes.IS_USER_BLOCK,
          queryParameters: {'studentId': studentId}, auth: true);
      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
}
