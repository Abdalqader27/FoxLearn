import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/presentation/services/service_model.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';

class ApiService with DioClientMixin {
  Future<List<ServiceModel>> getServices(id) async {
    final List response = await (dioClient.get(
      ApiRoutes.Services,
      auth: true,
      queryParameters: {'subjectId': id},
    ));
    List<ServiceModel> list = [];
    response.forEach((data) => list.add(ServiceModel.fromJson(data)));
print(list.length);
    return list;
  }
}
