
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/dio_client.dart';

mixin DioClientMixin {
  final DioClient dioClient = DioClient(ApiRoutes.BASE_URL);
}
