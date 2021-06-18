import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foxlearn/app/database/app_db.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/api_point_of_sale.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/components/google-maps.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/pos_loc_model.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/objects.dart';
import 'package:foxlearn/common/utils/shared-preferences.dart';
import 'package:foxlearn/resources/theme/colors.dart';

import 'package:location/location.dart';
import 'package:provider/provider.dart';

class PointOfSaleMap extends StatefulWidget {
  const PointOfSaleMap({Key? key}) : super(key: key);

  @override
  _PointOfSaleMapState createState() => _PointOfSaleMapState();
}

class _PointOfSaleMapState extends State<PointOfSaleMap> {
  bool flag = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PosLocModel>>(
        future: ApiPointOfSale().getPosLocation(),
        builder: (_, s) {
          if (s.data == null)
            return LottieLoading();
          else {
            final data = s.data;
            if (!flag) {
              for (int i = 0; i < data!.length; ++i) {
                appDatabase.posLocDao.insert(PosLocTableData(
                    id: data[i].id,
                    name: data[i].name,
                    lag: data[i].lag.toString(),
                    lat: data[i].lat.toString()));
              }
              flag = true;
            }
            return FutureBuilder(
                future: SharedPreferencesHandler.getSharedPreference(
                    "mapType", ValueType.BOOL),
                builder: (context, snapshot) {
                  if (snapshot.data == null) return LottieLoading();
                  return GoogleMapsScreen(
                    isMapSatellite: snapshot.data,
                  );
                });
          }
        });
  }
}
