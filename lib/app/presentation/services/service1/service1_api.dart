import 'dart:convert';

import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/presentation/services/service1/nfa_dfa_output.dart';
import 'package:foxlearn/common/api_tools/api_result.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/api_tools/network_exceptions.dart';
import 'package:foxlearn/common/utils/logs.dart';

import 'automate_input_model.dart';

class Service1Api with DioClientMixin {
  Future<NfaDfaModel?> nfaToDfa({required AutomateInput automate}) async {
    final response = await dioClient.post(
        ApiRoutes.NonDeterministicToDeterministic,
        data: automate.toJson());
    Logs.logger.i(response);
    if (response != null) return NfaDfaModel.fromJson(response);
    return null;
  }
}
