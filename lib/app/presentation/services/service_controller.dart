import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/services/api_service.dart';
import 'package:foxlearn/app/presentation/services/service_model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ServiceController extends GetxController
    with StateMixin<List<ServiceModel>> {
  late var currentPage;
  late PageController controller;

  final int id;

  final _obj = ''.obs;

  ServiceController(this.id);

  set obj(value) => _obj.value = value;

  get obj => _obj.value;

  @override
  void onInit() {
    super.onInit();
    change(value, status: RxStatus.loading());

    ApiService().getServices(id).then((value) {
      currentPage = value.length - 1;
      controller = PageController(initialPage: value.length - 1);
      controller.addListener(() {
        currentPage = controller.page!;
        if (value.isEmpty)
          change(value, status: RxStatus.empty());
        else
          change(value, status: RxStatus.success());
      });
      if (value.isEmpty)
        change(value, status: RxStatus.empty());
      else
        change(value, status: RxStatus.success());
    });
  }
}
