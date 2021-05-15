import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';

class NotificationDesc extends StatelessWidget {
  final String desc;
  final int? maxLines;

  const NotificationDesc({Key? key, required this.desc, required this.maxLines}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: AppTextStyles.medium(),
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
