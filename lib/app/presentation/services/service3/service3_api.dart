import 'dart:convert';

import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/presentation/services/service1/automate_input_model.dart';
import 'package:foxlearn/app/presentation/services/service1/nfa_dfa_output.dart';
import 'package:foxlearn/app/presentation/services/service3/eps_nfa_dfa.dart';
import 'package:foxlearn/common/api_tools/api_result.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';
import 'package:foxlearn/common/utils/logs.dart';

class Service3Api with DioClientMixin {
  Future<EpsNfaDfa?> epsNfaDfa({required AutomateInput automate}) async {
    final response =
        await dioClient.post(ApiRoutes.EpsNfaToNfa, data: automate.toJson());
    Logs.logger.i(response);
    if (response != null) return EpsNfaDfa.fromJson(response);
    return null;
  }
}
