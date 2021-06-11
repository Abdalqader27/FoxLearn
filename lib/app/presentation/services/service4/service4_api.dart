import 'dart:convert';

import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/presentation/services/service1/automate_input_model.dart';
import 'package:foxlearn/app/presentation/services/service1/nfa_dfa_output.dart';
import 'package:foxlearn/app/presentation/services/service4/req_dfa_out.dart';
import 'package:foxlearn/common/api_tools/api_result.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';
import 'package:foxlearn/common/utils/logs.dart';

class Service4Api with DioClientMixin {
  Future<RegToDfaOut?> regToDfa({required AutomateInput automate}) async {
    final response =
        await dioClient.post(ApiRoutes.RegToDfa, data: automate.toJson());
    Logs.logger.i(response);
    if (response != null) return RegToDfaOut.fromJson(response);
    return null;
  }
}
