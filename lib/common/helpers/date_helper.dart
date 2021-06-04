// import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

class DateHelper {
  static bool isDatePass(String date) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.compareTo(DateTime.now()).isNegative;
  }

  static String dayFormat ( String date){
    return  DateFormat('yyyy-MM-dd').format(DateTime.parse(date)).toString();
  }

  static String dayTimeFormat( String date){
    return  DateFormat('yyyy-MM-dd\nHH:mm').format(DateTime.parse(date)).toString();
  }
}
