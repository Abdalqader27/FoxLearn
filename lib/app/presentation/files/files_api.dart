import 'dart:convert';

import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';

import 'files_model.dart';

class FilesApi with DioClientMixin {
  Future<List<FilesModel>> getAllFiles() async {
    final response = await dioClient.get(ApiRoutes.Files,queryParameters: {"subjectId":1});
    List<FilesModel>list=[];
    response.forEach((item) => list.add(FilesModel.fromJson(item)));
    return list;
  }
}
