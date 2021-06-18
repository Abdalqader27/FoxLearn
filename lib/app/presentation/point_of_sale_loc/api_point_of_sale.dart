import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/pos_loc_model.dart';
import 'package:foxlearn/common/api_tools/api_result.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';

class ApiPointOfSale with DioClientMixin {
  Future<List<PosLocModel>> getPosLocation() async {
    final List response =
        await (dioClient.get(ApiRoutes.PosLocation, auth: true));
    List<PosLocModel> list = [];
    response.forEach((data) => list.add(PosLocModel.fromJson(data)));

    return list;
  }
}
