import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../controllers/note_controller.dart';
import '../pages/add_new_note_page.dart';
import '../pages/note_detail_page.dart';
import '../widgets/alertdialog_widget.dart';
import '../widgets/search_bar.dart';

class HomeNotePage extends StatelessWidget {
  final controller = Get.put(NoteController());

  Widget emptyNotes() {
    return Container(
      child: Center(
        child: Text(
          "لايوجد ملاحظات",
        ),
      ),
    );
  }

  Widget viewNotes() {
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: StaggeredGridView.countBuilder(
          itemCount: controller.notes.length,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  NoteDetailPage(),
                  arguments: index,
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogWidget(
                      contentText: "Are you sure you want to delete the note?",
                      confirmFunction: () {
                        controller.deleteNote(controller.notes[index].id);
                        Get.back();
                      },
                      declineFunction: () {
                        Get.back();
                      },
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color:  AppColors.LIGHT_Red.withOpacity(.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.notes[index].title}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${controller.notes[index].content}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${controller.notes[index].dateTimeEdited}",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NoteController>(
        builder: (_) => controller.isEmpty()
            ? emptyNotes()
            : Stack(
                children: [
                  viewNotes(),

                  Positioned(
                    bottom: 0,
                    child: Card(
                      margin: EdgeInsets.all(25),
                      elevation: 0,
                      shape: AppStyles.cardStyle4,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              showSearch(context: context, delegate: SearchBar());
                            },
                          ),
                          PopupMenuButton(
                            onSelected: (val) {
                              if (val == 0) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialogWidget(
                                      contentText:
                                          "هل أنت متأكد أنك تريد حذف جميع الملاحظات",
                                      confirmFunction: () {
                                        controller.deleteAllNotes();
                                        Get.back();
                                      },
                                      declineFunction: () {
                                        Get.back();
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 0,
                                child: Text(
                                  "حذف جميع الملاحظات ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.LIGHT_Red,
        onPressed: () {
          Get.to(AddNewNotePage());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
