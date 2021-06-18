import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/components/search-bar.dart';

LinearGradient linearGradient(context) => LinearGradient(colors: [
      Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : Color(0xfffbfbfb),
      Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : Color(0xfffbfbfb).withOpacity(.2),
    ], begin: Alignment.center, end: Alignment.bottomCenter, tileMode: TileMode.clamp);

Widget appBarGradients({required context}) => Positioned(
    left: 0,
    top: 0,
    right: 0,
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: linearGradient(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBarMap(),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 15),
          //   padding: EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       border: Border.all(color: AppColors.ACCENT, width: 2)),
          //   child: Text(
          //     "العدد ",
          //     style: TextStyle(color: AppColors.ACCENT),
          //   ),
          // ),
        ],
      ),
    ));
