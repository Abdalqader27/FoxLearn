import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foxlearn/app/database/app_db.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/api_point_of_sale.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/components/google-maps.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/pos_controller.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/pos_loc_model.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/objects.dart';
import 'package:foxlearn/common/utils/shared-preferences.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class PointOfSaleMap extends GetView<PosController> {
  const PointOfSaleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>PosController());
    return controller.obx((state) {
      return GoogleMapsScreen();
    }, onLoading: LottieLoading());
  }
}
