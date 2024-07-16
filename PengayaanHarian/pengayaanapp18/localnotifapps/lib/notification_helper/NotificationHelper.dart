import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  // Flutter Local Notification Plugin
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // Notification Payload
  static ValueNotifier<String> payload = ValueNotifier('');

  // Set the payload
  void setPayload(String newPayload) {
    payload.value = newPayload;
  }

  // Inisialisasikan Setting Channel Notifikasi untuk iOS/MacOS
  static DarwinNotificationDetails iOSNotificationDetails = const DarwinNotificationDetails(
    threadIdentifier: 'local_notif',
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  // Notifications Details untuk multi platform
  static NotificationDetails notificationDetails(Color color) {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'Sanber Notif',
      'Local Notif',
      channelDescription: 'Untuk percobaan Local Notif',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      playSound: true,
      enableVibration: true,
      color: color,
    );

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSNotificationDetails,
    );
  }
}

// Fungsi untuk inisialisasi local notifications
Future<void> initLocalNotifications() async {
  // Config for Android
  const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

  // Config for iOS & MacOS
  const initializationSettingsIOS = DarwinInitializationSettings();

  // Initializations.
  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  // Inisialisasikan Konfigurasi dari Local Notification.
  await NotificationHelper.flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      // Handle ketika notifikasi ditekan.
      debugPrint('Notifikasi Ditekan ${details.payload}');
      NotificationHelper().setPayload(details.payload ?? '');
    },
  );

  // Request Permission untuk Android 13 ke atas.
  await NotificationHelper.flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  // Request Permission untuk iOS
  await NotificationHelper.flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
    alert: true,
    badge: true,
    sound: true,
  );
}