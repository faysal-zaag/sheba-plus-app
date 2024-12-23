import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/notification/notification_details_screen.dart';

import '../main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  Log.info(message.toString());
  FirebaseController().handleMessage(message);
}

class FirebaseController {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Important Notifications',
    description: "",
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    final storageService = StorageService();
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    Log.info("FCM Token is => $fcmToken");
    storageService.saveFCMToken(fcmToken!);
    initPushNotifications();
    initLocalNotifications();
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) async {
      final notification = message.notification;

      Log.debug(message.data.toString());

      if (notification == null) return;

      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(_androidChannel.id, _androidChannel.name,
                  channelDescription: _androidChannel.description, icon: 'ic_launcher', importance: Importance.max, priority: Priority.high),
              iOS: const DarwinNotificationDetails()),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future initLocalNotifications() async {
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await _localNotifications.initialize(initializationSettings, onDidReceiveNotificationResponse: (notificationResponse) {
      final String? payload = notificationResponse.payload;
      if (payload != null) {
        final message = RemoteMessage.fromMap(jsonDecode(payload));

        handleMessage(message);
      }
    });
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    if (message.data['notificationType'] != AgentOrderNotificationType.COMMON_USER_NOTIFICATION.name) {
      UserNotification notification = UserNotification.fromJson(message.data).copyWith(readStats: false);

      Navigator.push(
        navigatorKey.currentState!.context,
        MaterialPageRoute(
          builder: (context) => NotificationDetailsScreen(
            notification: notification,
          ),
        ),
      );
    }
  }
}
