import 'package:flutter/material.dart';
import 'package:foxlearn/resources/values/styles.dart';

class AlertDialogWidget extends StatelessWidget {
  final String contentText;
  final VoidCallback confirmFunction;
  final VoidCallback  declineFunction;

  AlertDialogWidget({
  required  this.contentText,
    required  this.confirmFunction,
    required    this.declineFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: AppStyles.cardStyle3,
      content: Text(
        contentText,
      ),
      actions: [
        TextButton(
          onPressed: declineFunction,
          child: Text("لا"),
        ),
        TextButton(
          onPressed: confirmFunction,
          child: Text("نعم"),
        ),
      ],
    );
  }
}
