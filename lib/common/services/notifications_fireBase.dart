import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/common/widgets/dialogs/notification_dialog.dart';

class FirebaseNotification {
  final BuildContext context;

  FirebaseNotification({required this.context});

  void setUpFirebase() async {
    await FirebaseMessaging.instance.subscribeToTopic('all');
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    ///TODO Do not forget dave token
    // await FirebaseMessaging.instance
    //     .getToken()
    //     .then((value) => serviceLocator<LoginFacadeService>().setToken(value));
    FirebaseMessaging.onMessage.listen((event) => onMessage(event));
  }

  Future<dynamic> onMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      final body = notification.body;
      final title = notification.title;
      if (body != null && title != null)
        await notificationDialog(context: context, subTitle: body, title: title);
    }
  }

  Future<dynamic> notificationDialog({
    required String title,
    required String subTitle,
    required BuildContext context,
  }) {
    return showDialog(
        context: context,
        builder: (context) => NotificationDialog(
              title: title,
              subTitle: subTitle,
              onConfirm: () => Navigator.of(context).pop(),
              textButtonConfirm: "حسناً",
            ));
  }
}
