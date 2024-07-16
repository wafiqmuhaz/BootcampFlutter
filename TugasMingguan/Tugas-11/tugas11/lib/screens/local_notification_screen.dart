import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../helpers/notification_helper.dart';
import '../helpers/socket_helper.dart';

class LocalNotificationScreen extends StatefulWidget {
  const LocalNotificationScreen({super.key});

  @override
  State<LocalNotificationScreen> createState() => _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<LocalNotificationScreen> {
  final socket = SocketHelper();

  @override
  void initState() {
    super.initState();
    socket.connectAndListen();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<String>(
                stream: socket.getResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "Menampilkan Data dari Socket : ${snapshot.data}",
                      style: TextStyle(
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                      ),
                    );
                  } else {
                    return const Text("Menampilkan Notifikasi");
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {

                // Reset Payload Value
                NotificationHelper.payload.value = "";

                Color randomColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

                // Kirim Notifikasi
                await NotificationHelper.flutterLocalNotificationsPlugin.show(
                  math.Random().nextInt(99),
                  "Aplikasi menampilkan Notifikasi",
                  "Menampilkan Notifikasi berhasil!!!",
                  NotificationHelper.notificationDetails(randomColor),
                  payload: jsonEncode({"data": "test"}),
                );

                socket.callMsgEvent();
              },
              child: const Text("Panggil Event"),
            ),
          ],
        ),
      );
  }
}
