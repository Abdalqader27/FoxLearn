import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/infrastructure/data_sources/active_code/active_routes.dart';
import 'package:foxlearn/common/api_tools/dio_client.dart';
import 'package:foxlearn/common/exceptions/network_expcepations/network_exceptions.dart';

class ActiveCodeProvider with DioClientMixin {

  ///----------------- active code---------------
  Future<Either<NetworkExceptions?, bool>> activeCode(
      {required String code}) async {
    try {
      final response = await dioClient.post(ActiveRoutes.POST_ACTIVE_CODE, data: json.encode(code));
      return Right(response["isSuccess"]);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
