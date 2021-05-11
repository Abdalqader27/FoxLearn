import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxlearn/app/root/presentation/root/root_bloc/root_bloc.dart';
import 'package:foxlearn/app/root/presentation/root/root_bloc/root_event.dart';
import 'package:foxlearn/app/root/presentation/root/root_bloc/root_state.dart';
import 'package:foxlearn/app/root/presentation/widgets/app_bar.dart';
import 'package:foxlearn/app/root/presentation/widgets/bottom_navigation.dart';
import 'package:foxlearn/app/root/presentation/widgets/drawers_components.dart';
import 'package:foxlearn/app/root/presentation/widgets/root_background.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../home/home_screen.dart';
import '../my_notes/my_notes_screen.dart';
import '../notification/notification_screen.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _drawerItems = DrawerComponent().getItems(context);
    final MyNotesScreen _myNoteScreen = MyNotesScreen();
    final NotificationScreen _notificationScreen = NotificationScreen();
    final HomeScreen _homeScreen = HomeScreen();
    return Scaffold(
        backgroundColor: AppColors.CARD_COLOR,
        body: SafeArea(
            child: Stack(
          children: [
            /// Background Sections  ------------------------------------
            RootBackground(marginBottom: 5.0),

            Scaffold(
                backgroundColor: Colors.transparent,
                drawer: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0.sp),
                    bottomLeft: Radius.circular(25.0.sp),
                  ),

                  /// Drawer Check Items -------------------------------
                  child: Drawer(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: List.generate(
                        _drawerItems.length,
                        (index) => _drawerItems[index],
                      ),
                    ),
                  ),
                ),

                /// Body-----------------------------------------------------------
                body: BlocBuilder<RootBloc, RootState>(
                  bloc: serviceLocator<RootBloc>(),
                  builder: (context, state) {
                    return Column(
                      children: [
                        SizedBox(height: 3.0.h),

                        /// App Bar Sections ----------------------------------
                        AppAppBar(
                          pageIndex: state.indexPage,
                          onTapDrawer: () => Scaffold.of(context).openDrawer(),
                        ),

                        /// Page View Sections -------------------------------
                        Expanded(
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: serviceLocator<RootBloc>().pageController,
                            children: [
                              _notificationScreen,
                              _homeScreen,
                              _myNoteScreen,
                            ],
                            onPageChanged: (index) {
                              onTabBottomNavigation(index);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                bottomNavigationBar: BlocBuilder<RootBloc, RootState>(
                  bloc: serviceLocator.get<RootBloc>(),
                  builder: (context, state) {
                    return AppBottomNavigation(
                      state: state,
                      onTabBottomNavigation: onTabBottomNavigation,
                    );
                  },
                )),
          ],
        )));
  }

  onTabBottomNavigation(int index) {
    serviceLocator<RootBloc>()..add(ChangeIndex(index));
  }
}
