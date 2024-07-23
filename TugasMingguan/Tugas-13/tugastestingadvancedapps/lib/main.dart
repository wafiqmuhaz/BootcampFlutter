import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'services/api_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(apiService: ApiService(),),
    );
  }
}