import 'dart:convert';

import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/presentation/tests/subject_model.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';

import 'files_model.dart';

class FilesApi with DioClientMixin {
  Future<List<FilesModel>> getAllFiles(int id) async {
    final response = await dioClient
        .get(ApiRoutes.Files, queryParameters: {"subjectId": id});
    List<FilesModel> list = [];
    response.forEach((item) => list.add(FilesModel.fromJson(item)));
    return list;
  }

  Future<List<SubjectsModel>> getSubjects() async {
    final List response = await (dioClient.get(ApiRoutes.Subjects, auth: true));
    List<SubjectsModel> list = [];
    response.forEach((data) => list.add(SubjectsModel.fromJson(data)));

    return list;
  }
}
