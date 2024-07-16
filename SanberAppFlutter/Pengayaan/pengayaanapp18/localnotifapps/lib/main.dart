import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:templateapps/notification_helper/NotificationHelper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Notification Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Local Notification",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Push Notification
            ValueListenableBuilder(
              valueListenable: NotificationHelper.payload,
              builder: (context, value, child) {
                return Text(
                  "Local Notification Payload: \n$value\n",
                  textAlign: TextAlign.center,
                );
              },
            ),

            // Kirim Notifikasi
            ElevatedButton(
              onPressed: () async {
                // Reset Payload Value
                NotificationHelper.payload.value = "";

                // Generate random color
                Color randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

                // Kirim Notifikasi
                await NotificationHelper.flutterLocalNotificationsPlugin.show(
                  Random().nextInt(99),
                  "Judul Local Notifications",
                  "Percobaan untuk menampilkan Local Notifications",
                  NotificationHelper.notificationDetails(randomColor),
                  payload: jsonEncode({"data": "test"}),
                );
              },
              child: const Text(
                "Kirim Notifikasi",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
