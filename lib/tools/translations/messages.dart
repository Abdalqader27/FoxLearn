import 'package:foxlearn/tools/translations/arabic_tr.dart';
import 'package:foxlearn/tools/translations/english_tr.dart';
import 'package:foxlearn/tools/translations/german_tr.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishTr.getEnglish(),
        'ar_SY': ArabicTr.getArabic(),
        'de_AT': GermanTr.getGerman(),
      };
}
