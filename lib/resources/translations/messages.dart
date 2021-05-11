
import 'package:get/get.dart';

import 'arabic_tr.dart';
import 'english_tr.dart';
import 'german_tr.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishTr.getEnglish(),
        'ar_SY': ArabicTr.getArabic(),
        'de_AT': GermanTr.getGerman(),
      };
}
