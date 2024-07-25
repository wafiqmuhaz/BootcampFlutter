// // Inisialisasi
// Future<void> init() async {
//   // Request Notification Permission
//   await FirebaseMessaging.instance.requestPermission();

//   // Get FCM Token
//   final fcmToken = await FirebaseMessaging.instance.getToken();
//   debugPrint("FCM TOKEN : $fcmToken");
// }

// //
// // Handle Notification jika ditekan dari kondisi App ditutup
// FirebaseMessaging.instance.getInitialMessage().then(
//   (value) {
//     // Set Payload pada [Notification Helper]
//     NotificationHelper.payload.value = jsonEncode(
//       {
//         "title": value?.notification?.title,
//         "body": value?.notification?.body,
//         "data": value?.data,
//       },
//     );
//   },
// );

// // Handle Notification jika ditekan dari kondisi Minimized
// FirebaseMessaging.onMessageOpenedApp.listen((value) {
//   // Set Payload pada [Notification Helper]
//   NotificationHelper.payload.value = jsonEncode(
//     {
//       "title": value.notification?.title,
//       "body": value.notification?.body,
//       "data": value.data,
//     },
//   );
// });

// // Handle Notification jika ditekan dari kondisi App dibuka
// FirebaseMessaging.onMessage.listen(
//   (message) async {
//     // Data notifikasi
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     // Jika notifikasi masuk, dan platform adalah Android.
//     if (notification != null && android != null && !kIsWeb) {
//       // Tampilkan Notifikasi menggunakan Local Notification.
//       await NotificationHelper.flutterLocalNotificationsPlugin.show(
//         Random().nextInt(99),
//         notification.title,
//         notification.body,
//         payload: jsonEncode(
//           {
//             "title": notification.title,
//             "body": notification.body,
//             "data": message.data,
//           },
//         ),
//         NotificationHelper.notificationDetails,
//       );
//     }
//   },
// );

// // Try Decode Data
// static Map<String, dynamic> tryDecode(data) {
//   try {
//     return jsonDecode(data);
//   } catch (e) {
//     return {};
//   }
// }

// void main() async {
//   // Tambahkan [ensureInitialized] agar fungsi di bawahnya
//   // dijalankan saat Flutter App benar-benar ter-inisialisasi.
//   WidgetsFlutterBinding.ensureInitialized();

//   // Inisialisasi Project Firebase
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // Inisialisasi Local Notification
//   await NotificationHelper().initLocalNotifications(); // Tambahkan Ini

//   // Inisialisasi FCM
//   await FcmHelper().init(); // Tambahkan Ini
//   runApp(const MyApp());
// }

// import 'package:flutter/material.dart';
// import 'package:sanber_playground/helpers/fcm_helper.dart';
// import 'package:sanber_playground/helpers/notification_helper.dart';

// class MateriCloudMessaging extends StatefulWidget {
//   const MateriCloudMessaging({super.key});

//   @override
//   State<MateriCloudMessaging> createState() => _MateriCloudMessagingState();
// }

// class _MateriCloudMessagingState extends State<MateriCloudMessaging> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Materi Cloud Messaging",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: ValueListenableBuilder(
//           valueListenable: NotificationHelper.payload,
//           builder: (context, value, child) {
//             // Actual Data
//             final valueJson = FcmHelper.tryDecode(value);

//             return Center(
//               child: Column(
//                 children: [
//                   // Title
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     child: Text(
//                       "Notif Title : ${valueJson["title"]}",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   // Content
//                   Text(
//                     "Notif Content : ${valueJson["body"]}",
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }