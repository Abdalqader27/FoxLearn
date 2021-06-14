import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/app/infrastructure/models/my_files.dart';
import 'package:foxlearn/app/presentation/files/files_api.dart';
import 'package:foxlearn/app/presentation/files/files_model.dart';
import 'package:foxlearn/app/presentation/files/pdf_screen.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/widgets/title_text.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/theme.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  _FilesScreenState createState() => _FilesScreenState();
}


Widget _title(future) {
  return FutureBuilder<List<dynamic>>(
    future: future,
    builder: (context, snapshot) {
      return Container(
          child: Padding(
        padding: const EdgeInsets.only(right: 28.0, left: 28, top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TitleText(
              text: snapshot.data != null
                  ? 'لديك ${snapshot.data!.length} ملفات  متوفرة '
                  : "الرجاء الإنتظار",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.White,
            ),
          ],
        ),
      ));
    }
  );
}

class _FilesScreenState extends State<FilesScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Future<List<FilesModel>> future;
  RxString count = "".obs;

  // List<MyFiles> list = List<MyFiles>.generate(
  //     10,
  //     (index) => MyFiles(
  //         className: "className",
  //         objectId: "objectId",
  //         createdAt:  DateTime.parse("2019-09-30"),
  //         updatedAt: DateTime.parse("2019-09-30"),
  //         fileName: "fileName",
  //         myFile: MyFile(name: "das", type: "dsadad", url: "dsadasd"),
  //         universityId: 3,
  //         isActivited: true));

  @override
  void initState() {
    future = FilesApi().getAllFiles();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getPopularCourseUI();
  }

  Widget getPopularCourseUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: _title(future),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Card(
            color: AppColors.CARD_COLOR,
            margin: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
            elevation: 0,
            shape: AppStyles.cardStyle3,
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, left: 6, right: 6),
              child: FutureBuilder<List<FilesModel>>(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) return LottieLoading();
                    if(count.value=="")count(snapshot.data!.length.toString());
                    return ListView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: GridView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                children: List<Widget>.generate(
                                  snapshot.data!.length,
                                  (int index) {
                                    final int count = snapshot.data!.length;
                                    final Animation<double> animation =
                                        Tween<double>(begin: 0.0, end: 1.0)
                                            .animate(
                                      CurvedAnimation(
                                        parent: animationController,
                                        curve: Interval(
                                            (1 / count) * index, 1.0,
                                            curve: Curves.easeInOutQuart),
                                      ),
                                    );
                                    animationController.forward();
                                    return BouncingWidget(
                                      duration: Duration(milliseconds: 1000),
                                      scaleFactor: 1.5,
                                      onPressed: () {
                                        Get.to(() => PdfScreen(
                                              file: snapshot.data![index],
                                            ));
                                      },
                                      child: CategoryView(
                                        myFiles: snapshot.data![index],
                                        animation: animation,
                                        animationController:
                                            animationController,
                                      ),
                                    );
                                  },
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 0.0,
                                        crossAxisSpacing: 0.0,
                                        childAspectRatio: 1.2),
                              )),
                        ]);
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryView extends StatelessWidget {
  CategoryView(
      {Key? key,
      required this.animationController,
      required this.animation,
      required this.myFiles})
      : super(key: key);
  final FilesModel myFiles;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Column(
              children: <Widget>[
                TitleText(
                  text: '${myFiles.fileName} ',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 8, left: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0)),
                                  color: Colors.grey[400]!.withOpacity(.1)),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                child: AspectRatio(
                                    aspectRatio: 1.4,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: SvgPicture.asset(
                                                "assets/svg/pdf2.svg"),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
