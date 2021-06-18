import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/presentation/tests/subject_model.dart';
import 'package:foxlearn/app/presentation/tests/test_model.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';

class TestsApi with DioClientMixin {
  Future<List<TestModel>> getQuestion(id) async {
    final List response = await (dioClient
        .get(ApiRoutes.Test, auth: true, queryParameters: {'subjectId': id}));
    List<TestModel> list = [];
    response.forEach((data) => list.add(TestModel.fromJson(data)));

    return list;
  }

  Future<List<SubjectsModel>> getSubjects() async {
    final List response = await (dioClient.get(ApiRoutes.Subjects, auth: true));
    List<SubjectsModel> list = [];
    response.forEach((data) => list.add(SubjectsModel.fromJson(data)));

    return list;
  }
}
