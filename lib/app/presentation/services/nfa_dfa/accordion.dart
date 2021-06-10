import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';

class Accordion extends StatelessWidget {
  Widget widget;
  String label;

  Accordion(this.widget, this.label);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ScrollOnExpand(
        child: Card(
          shape: BeveledRectangleBorder(
              side: BorderSide(color: AppColors.grey.withOpacity(.05)),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.arrow_right,
                            collapseIcon: Icons.arrow_drop_down,
                            iconColor: Colors.black,
                            iconSize: 28.0,
                            iconRotationAngle: math.pi / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            label,
                            style: Theme.of(context).textTheme.body2!.copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expanded: widget,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
