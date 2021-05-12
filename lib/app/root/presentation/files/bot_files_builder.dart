// import 'package:QuizX/Views/BottomNavigationScreen/Boot/bot_files_screen.dart';
// import 'package:QuizX/Views/BottomNavigationScreen/Boot/moor/boot_files_database.dart';
// import 'package:QuizX/Views/BottomNavigationScreen/Boot/provider/boot_files_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class BotFilesBuilder extends StatelessWidget {
//   final db = BotDatabase();
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider(create: (context) => db.filesDao),
//         Provider(create: (context) => db.foldersDao),
//         Provider(create: (context) => db.purchasesDao),
//       ],
//       child: ChangeNotifierProvider.value(
//         value: BotFilesProvider(db),
//         child: BootFiles(),
//       ),
//     );
//   }
// }
