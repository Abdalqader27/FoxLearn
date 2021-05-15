import 'package:flutter/material.dart';
import 'package:foxlearn/common/widgets/dialogs/confirm_dialog.dart';
import 'package:url_launcher/url_launcher.dart' as url;

Future<dynamic> callDialog(context) {
  return showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
            title: ' نسيت كلمة السر ',
            subTitle: ' الاتصال بالدعم الفني: 0944702046',
            onCallConfirm: () => url.launch('tel:0944702046'),
            textButtonConfirm: "اتصال",
            onCancel: () => Navigator.of(context).pop(),
          ));
}
