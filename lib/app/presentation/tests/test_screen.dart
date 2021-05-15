import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/home/widget/courses_banks/custom_tab_indicator.dart';
import 'package:foxlearn/app/presentation/tests/quiz_bank/quiz_bank_screen.dart';
import 'package:foxlearn/resources/theme/colors.dart';

import 'exam/exam_screen.dart';
import 'flash_card/flash_card_screen.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({Key? key}) : super(key: key);

  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Widget fragmentWidget;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 2, length: 3, vsync: this);
    fragmentWidget = QuizBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.White,
              unselectedLabelColor: AppColors.grey.withOpacity(.2),
              indicatorColor: Color(0xFFECEDED),
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              indicator: RoundedRectangleTabIndicator(color: AppColors.White, width: 25, weight: 4),
              physics: BouncingScrollPhysics(),
              onTap: (index) => setState(() => fragmentWidget = index == 0
                  ? ExamScreen()
                  : index == 1
                      ? FlashCard()
                      : QuizBank()),
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'اسئلة امتحانية ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'فلاش كارد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'بنك الأسئلة ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(child: fragmentWidget),
          )
          // FlipCard(
          //   direction: FlipDirection.HORIZONTAL, // default
          //   front: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Card(
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          //       elevation: 10,
          //       child: Container(
          //         height: MediaQuery.of(context).size.height / 3,
          //         child: Center(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               'ماهي الحدبة الحلقية ',
          //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          //   back: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Card(
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          //       elevation: 10,
          //       child: Container(
          //         height: MediaQuery.of(context).size.height / 3,
          //         child: Center(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               'هي عبارة عن كذا وكذا  ',
          //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
