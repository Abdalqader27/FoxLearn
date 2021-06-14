import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/presentation/root/widgets/root_background.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/widgets/progress_Indicator.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class PointOfSaleScreen extends StatefulWidget {
  const PointOfSaleScreen({Key? key}) : super(key: key);

  @override
  _PointOfSaleScreenState createState() => _PointOfSaleScreenState();
}

class _PointOfSaleScreenState extends State<PointOfSaleScreen> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 2.0.h),
        child: Stack(
          children: [
            FutureBuilder<Object>(
              future: null,
              builder: (context, snapshot) {

                return googleMap();
              }
            ),
            LottieLoading(),
            Container(
              height: 5.0.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.all(0),
                semanticContainer: false,
                borderOnForeground: false,
                clipBehavior: Clip.antiAlias,
                color: AppColors.LIGHT_Red,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                ),
              ),
              // child: CustomPaint(
              //   painter: RPSCustomPainter(AppColors.LIGHT_Red),
              // ),
            )
     ],
        ));
  }

  Widget googleMap() {
    return GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(34.8020744, 38.9968147), tilt: 0,zoom: 20),
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
