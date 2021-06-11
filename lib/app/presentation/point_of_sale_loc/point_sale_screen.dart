import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointOfSaleScreen extends StatefulWidget {
  const PointOfSaleScreen({Key? key}) : super(key: key);

  @override
  _PointOfSaleScreenState createState() => _PointOfSaleScreenState();
}

class _PointOfSaleScreenState extends State<PointOfSaleScreen> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return googleMap();
  }

  Widget googleMap() {
    return GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(34.8020744, 38.9968147), tilt: 0),
        onMapCreated: onMapCreated,
        indoorViewEnabled: false,
        compassEnabled: true,
        trafficEnabled: false,
        myLocationEnabled: true,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false);}

  void onMapCreated(GoogleMapController controller) =>
      googleMapController = controller;
}
