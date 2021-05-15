import 'package:flutter/cupertino.dart';

import '../../course_bank_item.dart';

class BanksContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (_, i) => CourseBankItem(
              courseBank: CourseBank.Course,
            ));
  }
}
