import 'package:flutter/material.dart';

import '../services/fcm_helper.dart';
import '../services/notification_helper.dart';

class MateriCloudMessaging extends StatefulWidget {
  const MateriCloudMessaging({super.key});

  @override
  State<MateriCloudMessaging> createState() => _MateriCloudMessagingState();
}

class _MateriCloudMessagingState extends State<MateriCloudMessaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Materi Cloud Messaging",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ValueListenableBuilder(
          valueListenable: NotificationHelper.payload,
          builder: (context, value, child) {
            // Actual Data
            final valueJson = FcmHelper.tryDecode(value);

            print("valueJson: $valueJson");

            return Center(
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Notif Title : ${valueJson["title"] ?? 'No Title'}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // Content
                  Text(
                    "Notif Content : ${valueJson["body"] ?? 'No Content'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
