import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';

class NotificationDate extends StatelessWidget {
  final String date;

  const NotificationDate({Key? key, required this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: AppTextStyles.medium(),
    );
  }
}
