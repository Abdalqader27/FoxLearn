import 'package:flutter/cupertino.dart';
import 'package:foxlearn/tools/constant/fonts.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:get/get.dart';
import 'package:language_pickers/language_picker_cupertino.dart';
import 'package:language_pickers/languages.dart';

class PickerLanguages {
  // It's sample code of Cupertino Item.
  static openCupertinoLanguagePicker(context) => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
          margin: EdgeInsets.all(15),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: AppColors.primaryColor)]),
          child: LanguagePickerCupertino(
              itemBuilder: _buildCupertinoItem,
              backgroundColor: AppColors.primaryColor,
              useMagnifier: true,
              languagesList: [
                {"isoCode": "ar", "name": "العربية "},
                {"isoCode": "en", "name": "English"},
                {"isoCode": "de", "name": "German"},
              ],
              pickerItemHeight: 45,
              pickerSheetHeight: 150.0,
              onValuePicked: selectLang)));

  static Widget _buildCupertinoItem(Language language) => Center(
      child: Text("${language.name}",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.sstArabicFont)));

  static selectLang(language) {
    switch (language.isoCode) {
      case "ar":
        Get.updateLocale(Locale('ar', 'SY'));
        break;
      case "en":
        Get.updateLocale(Locale('en', 'US'));
        break;
      case "de":
        Get.updateLocale(Locale('de', 'AT'));
        break;
    }
  }
}
