import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/root_controller.dart';
import 'package:foxlearn/app/presentation/files/files_screen.dart';
import 'package:foxlearn/app/presentation/home/home_screen.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/point_sale_screen.dart';
import 'package:foxlearn/app/presentation/root/widgets/app_bar.dart';
import 'package:foxlearn/app/presentation/root/widgets/bottom_navigation.dart';
import 'package:foxlearn/app/presentation/root/widgets/drawers_components.dart';
import 'package:foxlearn/app/presentation/root/widgets/root_background.dart';
import 'package:foxlearn/app/presentation/services/services_screen.dart';
import 'package:foxlearn/app/presentation/statistics/statistics_screen.dart';
import 'package:foxlearn/app/presentation/tests/test_screen.dart';
import 'package:foxlearn/app/presentation/user/user_screen.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RootScreen extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>RootController());
    return SafeArea(
        child: Stack(children: [
          /// Background Sections  ------------------------------------
          RootBackground(marginBottom: 0.0),
          Scaffold(
              backgroundColor: Colors.transparent,
              endDrawer: Card(
                margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),

                /// Drawer Check Items -------------------------------
                child: Drawer(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: List.generate(
                      DrawerComponent().getItems(context).length,
                          (index) => DrawerComponent().getItems(context)[index],
                    ),
                  ),
                ),
              ),

              /// Body-----------------------------------------------------------
              body: Column(
                children: [
                  SizedBox(height: 2.0.h),

                  /// App Bar Sections ----------------------------------
                  AppAppBar(
                      pageIndex: controller.indexPage.value,
                      onTapDrawer: () => Scaffold.of(context).openEndDrawer()

                  ),

                  /// Page View Sections -------------------------------
                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      children: [
                        HomeScreen(),
                        FilesScreen(),
                        ServicesScreen(),
                        TestsScreen(),
                        // StatisticsScreen(),
                        PointOfSaleScreen(),
                        UserScreen()
                      ],
                      onPageChanged: (index) {
                        onTabBottomNavigation(index);
                      },
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: AppCurvedBottomNavigation(
                  state: controller.indexPage.value,
                  onTabBottomNavigation: onTabBottomNavigation))
        ]));

  }

  onTabBottomNavigation(int index) {
    controller.setIndexPage(index);
  }
}
