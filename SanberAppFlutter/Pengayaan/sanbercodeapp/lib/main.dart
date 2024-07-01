import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'screen/homeScreen.dart';

void main() async {
  Gemini.init(
      apiKey: const String.fromEnvironment(
          'AIzaSyDRTztoJNhhwfso60gm_i80Dah_dOqdOfI'),
      enableDebugging: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}