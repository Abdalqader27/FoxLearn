import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';

Widget circleButton(context, {heroTag, tooltip, icon, onPressed}) => Container(
      padding: EdgeInsets.only(
          bottom: 20, left: 15, right: 5),
      child: FloatingActionButton(
          backgroundColor: AppColors.PRIMARY,
          mini: true,
          isExtended: false,
          heroTag: heroTag,
          onPressed: onPressed,
          child: icon,
          tooltip: '$tooltip '),
    );

Widget circleCloseButton(context, {heroTag, tooltip, icon, onPressed}) => Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                bottom: 80,
                left: 15,
                right: 15),
            child: FloatingActionButton(
                backgroundColor: AppColors.PRIMARY,
                mini: false,
                isExtended: false,
                heroTag: heroTag,
                onPressed: onPressed,
                child: Icon(
                  Icons.close,
                  color: AppColors.WHITE,
                ),
                tooltip: 'الغاء '),
          ),
        ],
      ),
    );
