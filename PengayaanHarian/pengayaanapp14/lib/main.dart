import 'package:flutter/material.dart';

import 'routers/router_class.dart';
import 'routers/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouterClass.generateRoute,
      initialRoute: RouteNames.loginScreen,
    );
  }
}