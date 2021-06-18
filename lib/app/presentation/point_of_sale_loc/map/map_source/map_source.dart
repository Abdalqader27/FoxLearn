import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../map_bloc_helper.dart';

class MapSource {
  static MapBlocHelper? mapBlocHelper;

  MapSource(GlobalKey<ScaffoldState> key) {
    if (mapBlocHelper == null) {
      mapBlocHelper = MapBlocHelper(key);
    }
    refreshKey(key);
  }
  static refreshKey(GlobalKey<ScaffoldState> key) {
    mapBlocHelper!.key = key;
  }
}
