import 'package:flutter/material.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/note_controller.dart';
import '../pages/edit_note_page.dart';
import '../pages/home_page.dart';
import '../widgets/alertdialog_widget.dart';

class NoteDetailPage extends StatelessWidget {
  final NoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final int i = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () {
              Get.to(
                EditNotePage(),
                arguments: i,
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              Get.bottomSheet(
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogWidget(
                                contentText:
                                    "هل تريد حذف  هذه الملاحظة ؟",
                                confirmFunction: () {
                                  controller.deleteNote(controller.notes[i].id);
                                  Get.offAll(HomeNotePage());
                                },
                                declineFunction: () {
                                  Get.back();
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.delete,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "حذف ",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        onPressed: () {
                          controller.shareNote(
                            controller.notes[i].title,
                            controller.notes[i].content,
                            controller.notes[i].dateTimeEdited,
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.share,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "مشاركة",
                              style: TextStyle(
                                fontSize: 11.0.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "تم اﻹنشاء  :  " +
                                  "${controller.notes[i].dateTimeCreated}",
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "عدد الكلمات :  " +
                                  controller.contentWordCount.toString(),
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "عدد المحارف  :  " +
                                  controller.contentCharCount.toString(),
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                shape: AppStyles.cardStyle4,

                backgroundColor: Colors.white,
              );
            },
          ),
        ],
      ),
      body: GetBuilder<NoteController>(
        builder: (_) => Scrollbar(
          child: Container(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SelectableText(
                    "${controller.notes[i].title}",
                    style: TextStyle(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "أخر تعديل  : " + "${controller.notes[i].dateTimeEdited}",
                    style: TextStyle(
                      fontSize: 11.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SelectableText(
                    "${controller.notes[i].content}",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
