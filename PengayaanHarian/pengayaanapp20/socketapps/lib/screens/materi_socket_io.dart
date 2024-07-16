import 'dart:convert';

import 'package:flutter/material.dart';
import '../helpers/notification_helper.dart';
import '../helpers/socket_helper.dart';
import 'dart:math' as math;

class MateriSocketIO extends StatefulWidget {
  const MateriSocketIO({super.key});

  @override
  State<MateriSocketIO> createState() => _MateriSocketIOState();
}

class _MateriSocketIOState extends State<MateriSocketIO> {
  final socket = SocketHelper();

  @override
  void initState() {
    super.initState();
    socket.connectAndListen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Materi Socket IO",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
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
                      "Data dari Socket : ${snapshot.data}",
                      style: TextStyle(
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                      ),
                    );
                  } else {
                    return const Text("Menunggu Data dari Socket");
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {

                // Reset Payload Value
                NotificationHelper.payload.value = "";

                // Kirim Notifikasi
                await NotificationHelper.flutterLocalNotificationsPlugin.show(
                  math.Random().nextInt(99),
                  "Aplikasi menampilkan Data",
                  "Menampilkan data dari socket berhasil!!!",
                  NotificationHelper.notificationDetails,
                  payload: jsonEncode({"data": "test"}),
                );

                socket.callMsgEvent();
              },
              child: const Text("Panggil Event"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
}
