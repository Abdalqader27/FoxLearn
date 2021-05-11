import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/auth/application/login_facade_service.dart';
import 'package:foxlearn/app/root/presentation/notification/widgets/notification_dialog_function.dart';
import 'package:foxlearn/injections/_injections.dart';

class FirebaseNotification {
  final BuildContext context;

  FirebaseNotification({required this.context});

  void setUpFirebase() async {
    await FirebaseMessaging.instance.subscribeToTopic('all');
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    await FirebaseMessaging.instance
        .getToken()
        .then((value) => serviceLocator<LoginFacadeService>().setToken(value));
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
}
