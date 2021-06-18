import 'package:foxlearn/app/database/app_db.dart';
import 'package:get/get.dart';

import 'api_point_of_sale.dart';

class PosController extends GetxController with StateMixin<bool> {
  @override
  onInit() {
    change(false, status: RxStatus.loading());
    repo().then((value) => change(value, status: RxStatus.success()));
    super.onInit();
  }

  Future<bool> repo() async {
    print("one");
    await AppDatabase().posLocDao.deleteAll();
    final data = await ApiPointOfSale().getPosLocation();
    for (int i = 0; i < data.length; ++i) {
      AppDatabase().posLocDao.insert(PosLocTableData(
          id: data[i].id,
          name: data[i].name,
          lag: data[i].lag.toString(),
          lat: data[i].lat.toString()));
    }
    return true;
  }
}
