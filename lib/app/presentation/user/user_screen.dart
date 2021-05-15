import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/user/user_screen_implement.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin, UserScreenImplement {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Container(
          child: Column(children: [
        titleImage(),
        SizedBox(height: 2.0.h),

        /// Tab Bar Sections
        tabBar(context),

        /// Body of tabBar view
        Expanded(child: tabBarView(animationController))
      ])),
    );
  }
}
