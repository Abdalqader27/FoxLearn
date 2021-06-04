import 'package:flutter/cupertino.dart';
import 'package:foxlearn/common/helpers/date_helper.dart';
import 'package:foxlearn/common/widgets/date_picker/src/cupertino_rounded_date_picker.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/fonts.dart';

void showDataPicker(context, controller) async {
  if (controller.birthdayController.text.isEmpty)
    controller.birthdayController.text =
        DateHelper.dayFormat(DateTime(2000, 6, 7).toString());
  CupertinoRoundedDatePicker.show(
    context,
    maximumDate: DateTime.now(),
    minimumYear: 1950,
    fontFamily: AppFonts.sstArabicFont,
    textColor: AppColors.LIGHT_BLACK,
    background: AppColors.White,
    borderRadius: 16,
    initialDate: controller.birthdayController.text.isEmpty
        ? DateTime(2000, 6, 7)
        : DateTime.parse(DateHelper.dayFormat(
            controller.birthdayController.text.toString())),
    initialDatePickerMode: CupertinoDatePickerMode.date,
    onDateTimeChanged: (newDateTime) {
      controller.birthdayController.text =
          DateHelper.dayFormat(newDateTime.toString());
    },
  );
}
