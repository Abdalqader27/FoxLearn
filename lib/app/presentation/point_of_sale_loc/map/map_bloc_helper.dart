import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foxlearn/app/database/app_db.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/api_point_of_sale.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/map/base_bloc.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/map_implement.dart';
import 'package:foxlearn/common/objects.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';
import '../place.dart';

class MapBlocHelper extends BaseBloc {
  late ClusterManager manager;
  late final List<ClusterItem<Place>> items = [];
  Set<Marker> markers = Set();

  final BehaviorSubject<bool> _isFilter = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<Set<Marker>> _markerList =
      BehaviorSubject<Set<Marker>>();

  Stream<Set<Marker>?> get markerList => _markerList.stream;

  Function(Set<Marker>) get changeMarkerList => _markerList.sink.add;

  Stream<bool> get isFilter => _isFilter.stream;

  Function(bool) get changeFilter => _isFilter.sink.add;

  Stream<bool> get getIsLoading => _isLoading.stream;

  Function(bool) get setIsLoading => _isLoading.sink.add;

  /// Contractor
  MapBlocHelper() {
    setIsLoading(true);
    database.posLocDao.watchAllWithLatLong().forEach((data) {
      items.clear();
      List.generate(data.length, (index) {
        if (data[index].lat.toString() != "null" &&
            data[index].lag.toString() != " null")
          try {
            items.add(ClusterItem(
                LatLng(
                  double.parse(data[index].lat.toString()),
                  double.parse(data[index].lag.toString()),
                ),
                item: Place(data[index].id, name: data[index].name)));
          } catch (e) {}
      });
    });

    manager = initClusterManager();
    setIsLoading(false);
  }

  /// init cluster with
  ClusterManager initClusterManager() {
    return ClusterManager<Place>(
      items,
      updateMarkers,
      markerBuilder: _markerBuilder,
      initialZoom: 12.0,
      stopClusteringZoom: 20.0,
    );
  }

  void updateMarkers(Set<Marker> markers) {
    setIsLoading(true);

    this.markers = markers;
    changeMarkerList(this.markers);
    setIsLoading(false);
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {},
          infoWindow: !cluster.isMultiple
              ? InfoWindow(
                  onTap: () async {
                    final data = await database.posLocDao
                        .getWithLatLongById(cluster.items.first!.shopId);
                    if (data != null) {}
                    // Functions.openIntent(
                    //     screen: ShopScreenInfo(
                    //         shop: myShop, favor: myShop.favorite),
                    //     context: key.currentContext!);
                  },
                  title: '${cluster.items.first!.name}')
              : InfoWindow.noText,
          icon: cluster.isMultiple
              ? await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
                  text: cluster.isMultiple ? cluster.count.toString() : null)
              : BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
        );
      };

  Future<List<String>> getSuggestions(String query) async {
    List<String> temp = await database.posLocDao.getMapSuggestion(query);

    return temp;
  }

  filterMarkers(String text) async {
    setIsLoading(true);
    if (text.isNotEmpty) {
      List<PosLocTableData> result =
          await database.posLocDao.getPosByName(text);
      manager.setItems(<ClusterItem<Place>>[
        for (int i = 0; i < result.length; ++i)
          ClusterItem(
              LatLng(double.tryParse(result[i].lat!)!,
                  double.tryParse(result[i].lag!)!),
              item: Place(result[i].id, name: result[i].name))
      ]);

      if (mapController != null)
        await mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(double.tryParse(result.first.lat!)!,
                  double.tryParse(result.first.lag!)!),
              zoom: 17),
        ));
    } else
      manager.setItems(items);
    setIsLoading(false);
  }

  filterMarkersByShop(List<PosLocTableData> itemShop) async {
    setIsLoading(true);
    manager
        .setItems(List<ClusterItem<Place>>.generate(itemShop.length, (index) {
      return ClusterItem(
          LatLng(
            double.tryParse(itemShop[index].lat!)!,
            double.tryParse(itemShop[index].lag!)!,
          ),
          item: Place(itemShop[index].id, name: itemShop[index].name));
    }));
    setIsLoading(false);
  }

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = AppColors.LIGHT_Red;
    final Paint paint2 = Paint()..color = AppColors.LIGHT_Red;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.1, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  @override
  void dispose() =>
      {_markerList.close(), _isFilter.close(), _isLoading.close()};
}
