import 'dart:developer';

import 'package:dorm_app/shared/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void connectNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(
        title: "${event.notification?.title}",
        description: "${event.notification?.body}",
        opacity: 0.5,
        position: SnackbarPosition.top,
        color: AppColors.sodaliteBlue,
        leading: event.notification?.android?.imageUrl == null
            ? null
            : Image.network(
                "${event.notification?.android?.imageUrl}",
                width: 80,
                height: 80,
              ),
      );
    });
    messaging
        .getToken()
        .then((value) => log("Token:$value", name: "FCM Token"));
  }

  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a bacground message:${message.messageId} ");
  }
}
