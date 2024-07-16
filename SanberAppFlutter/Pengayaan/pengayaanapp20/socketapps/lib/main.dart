import 'package:flutter/material.dart';

import '../helpers/notification_helper.dart';
import '../screens/materi_socket_io.dart';
import '../server/app_socket_server.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper().initLocalNotifications();
  AppSocketServer().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materi Socket IO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MateriSocketIO(),
    );
  }
}
