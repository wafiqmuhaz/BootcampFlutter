import 'package:flutter/material.dart';

import 'screen/comments_page.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comments App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const CommentsPage(),
    );
  }
}
