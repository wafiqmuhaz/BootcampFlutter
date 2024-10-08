// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC4xDJl40LK_fr5R-rfrHwTXXUrs8WF9Ao',
    appId: '1:367851523028:web:28379318fbab209c182441',
    messagingSenderId: '367851523028',
    projectId: 'finalappsanber',
    authDomain: 'finalappsanber.firebaseapp.com',
    storageBucket: 'finalappsanber.appspot.com',
    measurementId: 'G-J02G3YV9FE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCa-sKuXLIw18N07IdbTNOgFDf7ttRNtZw',
    appId: '1:367851523028:android:883a05fe06024ff8182441',
    messagingSenderId: '367851523028',
    projectId: 'finalappsanber',
    storageBucket: 'finalappsanber.appspot.com',
  );
}
