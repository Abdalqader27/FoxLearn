import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/infrastructure/data_sources/active_code/active_routes.dart';
import 'package:foxlearn/app/infrastructure/models/user_data.dart';
import 'package:foxlearn/common/api_tools/dio_client.dart';
import 'package:foxlearn/common/exceptions/network_expcepations/network_exceptions.dart';
import 'package:foxlearn/resources/values/keys.dart';
import 'package:get_storage/get_storage.dart';

class ActiveCodeProvider with DioClientMixin {
  ///----------------- active code---------------
  Future<Either<NetworkExceptions?, bool>> activeCode(
      {required String code}) async {
    try {
      UserAccount userAccount = UserAccount.fromJson(
          json.decode(GetStorage().read(AppKeys.USER_FLAG_KEY)));

      print("userId" + userAccount.id.toString());
      final response = await dioClient.get(ActiveRoutes.POST_ACTIVE_CODE,
          queryParameters: {'code': code, 'studentId': userAccount.id});

      return Right(response["code"]==code);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
