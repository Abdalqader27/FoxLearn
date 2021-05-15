import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/app/infrastructure/models/my_files.dart';
import 'package:foxlearn/common/widgets/title_text.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/theme.dart';
import 'package:foxlearn/resources/values/styles.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  _FilesScreenState createState() => _FilesScreenState();
}

Widget _title() {
  return Container(

      child: Padding(
    padding: const EdgeInsets.only(right: 28.0, left: 28, top: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TitleText(
          text: 'لديك 5 ملفات   متوفرة   ',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.White,
        ),
      ],
    ),
  ));
}

class _FilesScreenState extends State<FilesScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  List<MyFiles> list = List<MyFiles>.generate(
      10,
      (index) => MyFiles(
          className: "className",
          objectId: "objectId",
          createdAt:  DateTime.parse("2019-09-30"),
          updatedAt: DateTime.parse("2019-09-30"),
          fileName: "fileName",
          myFile: MyFile(name: "das", type: "dsadad", url: "dsadasd"),
          universityId: 3,
          isActivited: true));

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: _title(),
        ),
        SizedBox(height: 20,),
        Expanded(child: getPopularCourseUI()),
      ],
    );
  }

  Widget getPopularCourseUI() {
    return Card(
      color: AppColors.CARD_COLOR,
      margin: const EdgeInsets.only(top: 8.0, left: 16, right: 16),

      elevation: 0,
      shape: AppStyles.cardStyle3,
      child: Container(
        padding: const EdgeInsets.only(top: 8.0, left: 6, right: 6),

        child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: GridView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(
                    list.length,
                      (int index) {
                        final int count =    list.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animationController,
                            curve: Interval((1 / count) * index, 1.0,
                                curve: Curves.easeInOutQuart),
                          ),
                        );
                        animationController.forward();
                        return CategoryView(
                          myFiles: list[index],
                          animation: animation,
                          animationController: animationController,
                          callback: () {},
                        );
                      },
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 1.2),
                  )),
            ]),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  CategoryView(
      {Key? key,
      required this.animationController,
      required this.animation,
      required this.callback,
      required this.myFiles})
      : super(key: key);
  final VoidCallback callback;
  final MyFiles myFiles;
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
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
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
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: myFiles.isActivited ==
                                                      false
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              30.0),
                                                      child: SvgPicture.asset(
                                                          "assets/svg/unlock.svg"),
                                                    )
                                                  : SvgPicture.asset(
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
          ),
        );
      },
    );
  }
}
