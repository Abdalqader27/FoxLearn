import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Functions {
  static Future<String> getFileData(String path) async =>
      await rootBundle.loadString(path);


}
