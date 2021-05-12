import 'package:flutter/material.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Directionality(
    //   textDirection: TextDirection.rtl,
    //   child: Scaffold(
    //     body: SafeArea(
    //       child: Consumer<BotFilesProvider>(
    //         builder: (context, botFiles, child) {
    //           return Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               SizedBox(height: 16),
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 16),
    //                     child: TitleText(
    //                       text: 'بوت الملفات  ',
    //                       fontSize: 24,
    //                       fontWeight: FontWeight.w700,
    //                       color: AppColors.Black15,
    //                     ),
    //                   ),
    //                   Spacer(),
    //                   Visibility(
    //                     child: IconButton(
    //                         icon: !botFiles.loadingUFolder
    //                             ? Icon(
    //                                 Icons.refresh_outlined,
    //                                 size: 30,
    //                               )
    //                             : SizedBox(
    //                                 width: 30,
    //                                 height: 30,
    //                               ),
    //                         onPressed: !botFiles.loadingUFolder ? _refresh : null),
    //                   ),
    //                   SizedBox(
    //                     width: 16,
    //                   )
    //                 ],
    //               ),
    //               Expanded(
    //                 child: AnimatedSwitcher(
    //                   duration: Duration(milliseconds: 300),
    //                   child: botFiles.loadingUFolder
    //                       ? HappyLoading()
    //                       : Column(
    //                           children: [
    //                             Visibility(visible: botFiles.last != null, child: Header()),
    //                             Expanded(
    //                               flex: 2,
    //                               child: AnimatedSwitcher(
    //                                 duration: Duration(milliseconds: 300),
    //                                 child: botFiles.last != null
    //                                     ? FilesGrid(
    //                                         key: Key(botFiles.list.last.name),
    //                                         folder: botFiles.last,
    //                                       )
    //                                     : EmptyUniversityFolder(),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                 ),
    //               )
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }

  Future<void> _refresh() async {
    // BotFilesProvider botFiles = Provider.of<BotFilesProvider>(context, listen: false);
    // await botFiles.getUPath(refresh: true);
  }
}
