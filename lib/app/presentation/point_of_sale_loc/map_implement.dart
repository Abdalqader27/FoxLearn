import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'map/map_source/map_source.dart';

GoogleMapController? mapController;

class MapImplement {
  late String darkMapStyle, lightMapStyle;
  late CameraPosition cameraPosition;
  dynamic originLat, originLag;
  double currentZoom = 12.0;
  double previousZoom = 11.0;

  var mapType;

  Future loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString('assets/dark.json');
    lightMapStyle = await rootBundle.loadString('assets/uber_mode.json');
  }

  Future setMapStyle(context) async {
    if (mapController != null) {
      try {
        final theme = Theme.of(context).brightness;
        if (theme == Brightness.dark) {
          mapController!.setMapStyle(darkMapStyle);
        } else {
          mapController!.setMapStyle(lightMapStyle);
        }
      } catch (e) {}
    }
  }

  void onCameraMove(CameraPosition cameraPosition) {
    MapSource.mapBlocHelper.manager.onCameraMove(cameraPosition);
    if (currentZoom != previousZoom) {
      previousZoom = currentZoom;
      MapSource.mapBlocHelper.setIsLoading(true);
    } else {
      currentZoom = cameraPosition.zoom;
    }
  }

  void onCameraIdle() {
    MapSource.mapBlocHelper.manager.updateMap();
    if (currentZoom != previousZoom)
      MapSource.mapBlocHelper.setIsLoading(false);
  }

  void goToMyLocation(location) async {
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(location?.latitude, location?.longitude), zoom: 17),
    ));
  }

  // Widget showClosedFilterButton() => StreamBuilder<bool>(
  //     stream: MapSource.mapBlocHelper!.isFilter,
  //     builder: (context, snapshot) {
  //       if (snapshot.data == null || snapshot.data == false) return Container();
  //       return circleCloseButton(context, onPressed: () {
  //         MapSource.mapBlocHelper!.filterMarkers("");
  //         Provider.of<ShopFilterProvider>(context, listen: false).reset();
  //         MapSource.mapBlocHelper!.changeFilter(false);
  //       });
  //     });

  initCameraPosition(LocationData? myLocation) {
    cameraPosition = CameraPosition(
        target: (myLocation != null &&
                myLocation.latitude != null &&
                myLocation.longitude != null)
            ? LatLng(myLocation.latitude!, myLocation.longitude!)
            : LatLng(36.217224577189995, 37.14486960321665),
        zoom: 12.0);
  }

  Widget getMapLoading() => StreamBuilder<bool>(
      stream: MapSource.mapBlocHelper.getIsLoading,
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data == false) return Container();
        return Positioned(
          left: 20,
          top: 100,
          child: SizedBox(
            width: 25,
            height: 25,
            child: LottieLoading(),
          ),
        );
      });
}
