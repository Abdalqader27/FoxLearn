import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/components/material/appBar.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/map/map_source/map_source.dart';
import 'package:foxlearn/common/utils/shared-preferences.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../map_implement.dart';
import 'material/button-map.dart';

class GoogleMapsScreen extends StatefulWidget {
  final isMapSatellite;

  const GoogleMapsScreen({
    Key? key,
    this.isMapSatellite,
  }) : super(key: key);

  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin, MapImplement {
  @override
  bool get wantKeepAlive => true;

  @override
  void didChangePlatformBrightness() => setMapStyle(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    loadMapStyles();
    mapType = (!widget.isMapSatellite) ? MapType.normal : MapType.satellite;
  }

  @override
  void dispose() => {
        WidgetsBinding.instance!.removeObserver(this),
        super.dispose(),
      };

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        StreamBuilder(
            stream: MapSource.mapBlocHelper!.markerList,
            builder: (context, marker) {
              return SizedBox(
                key: Key(Theme.of(context).brightness.toString()),
                child: googleMapView(marker),
              );
            }),
        appBarGradients(context: context),
        mapButtons(),
        getMapLoading(),
      ],
    );
  }

  Widget googleMapView(marker) {
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController controller) => onMapCreated(controller),
      onCameraMove: onCameraMove,
      onCameraIdle: onCameraIdle,
      indoorViewEnabled: false,
      compassEnabled: true,
      trafficEnabled: false,
      myLocationEnabled: true,
      rotateGesturesEnabled: true,
      tiltGesturesEnabled: false,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      mapToolbarEnabled: false,
      markers: (marker.data != null) ? marker.data : Set(),
    );
  }

  onMapCreated(controller) {
    mapController = controller;
    MapSource.mapBlocHelper!.manager.setMapController(controller);
    setMapStyle(context);
  }

  changeMapSatellite() => setState(() {
        if (mapType == MapType.satellite) {
          SharedPreferencesHandler.setSharedPreference(key: "mapType", value: false);
          mapType = MapType.normal;
        } else {
          SharedPreferencesHandler.setSharedPreference(key: "mapType", value: true);
          mapType = MapType.satellite;
        }
      });

  Widget mapButtons() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            circleButton(context,
                icon: Icon(Icons.map_outlined, color: AppColors.WHITE),
                heroTag: "satalate",
                tooltip: "تغير عرض الخريطة ",
                onPressed: () => changeMapSatellite()),

          ],
        ),
      ),
    );
  }
}
