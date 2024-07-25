import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bloc/auth/authentication_bloc.dart';
import 'bloc/images/images_cubit.dart';
import 'firebase_options.dart';
import 'screens/auth_flow.dart';
import 'screens/home.dart';
import 'screens/sign_In.dart';
import 'screens/sign_up.dart';
import 'services/fcm_helper.dart';
import 'services/notification_helper.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await NotificationHelper().initLocalNotifications();
  await FcmHelper().init();

  var status = await Permission.storage.status;
  if (!status.isGranted) {
    // Meminta izin jika belum diberikan
    if (await Permission.storage.request().isDenied) {
      // Jika pengguna menolak permintaan izin
      print('Izin membaca penyimpanan eksternal ditolak');
      return;
    }
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider<ImagesCubit>(
          create: (BuildContext context) => ImagesCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth and Firestore App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthenticationFlowScreen(),
      routes: {
        SignupScreen.id: (context) => const SignupScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
