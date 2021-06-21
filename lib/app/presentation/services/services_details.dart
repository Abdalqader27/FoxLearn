import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/app/presentation/services/service_controller.dart';
import 'package:foxlearn/app/presentation/services/service_model.dart';
import 'package:foxlearn/app/presentation/services/services_screen.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/widgets/background/welcome_background.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ServiceDetails extends GetView<ServiceController> {
  final int id;

  const ServiceDetails(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ServiceController(id));

    return SafeArea(
      child: Scaffold(
          body: WelcomeBackground(
        child: controller.obx(
            (state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      shape: AppStyles.cardStyle1,
                      color: AppColors.LIGHT_Red,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          state!.first.subjectName.toString(),
                          style: AppTextStyles.medium(fontWeight: FontWeight.bold).copyWith(color: AppColors.White),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              CardScrollWidget(controller.currentPage, state),
                              Positioned.fill(
                                child: PageView.builder(
                                  itemCount: state.length,
                                  controller: controller.controller,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return Container();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            onLoading: LottieLoading()),
      )),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  final List<ServiceModel> data;

  CardScrollWidget(this.currentPage, this.data);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < data.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: Card(
              elevation: 4.7,
              clipBehavior: Clip.antiAlias,
              shape: AppStyles.cardStyle3,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Opacity(
                          opacity: .2,
                          child: Image.asset(
                            "assets/png/main_bottom.png",
                            fit: BoxFit.cover,
                            color: AppColors.grey,
                          )),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  Assets.svgLock,
                                  width: 20.0.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: ListTile(
                                  title: Text("${data[i].title}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  subtitle: Card(
                                    elevation: 0,
                                    shape: AppStyles.cardStyle4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${data[i].description})",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 30),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 0.0),
                                  //child: Text("Read Later",
                                  // style: TextStyle(color: Colors.white)),
                                  child: Container(
                                    child: Center(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                AppColors.LIGHT_Red,
                                            shape: BeveledRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(7)))),
                                        child: Text('بدأ الان',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
