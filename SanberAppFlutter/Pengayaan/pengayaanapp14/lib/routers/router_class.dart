import 'package:flutter/material.dart';
import 'package:tugassamberapp/pages/detail_page.dart';
import 'package:tugassamberapp/pages/home_page.dart';

import '../model/post_model.dart';
import '../pages/login_page.dart';
import 'routers.dart';

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.homeScreen:
        String data = settings.arguments as String;
        print("datahomeScreen: $data");
        return MaterialPageRoute(
          builder: (_) => HomePage(username: data),
        );
      case RouteNames.detailScreen:
        List<dynamic> data = settings.arguments as List<dynamic>;
        final post = data[0] as Post;
        final idUsers = data[1] as int;
        final colorUsers = data[2] as Color;

        return MaterialPageRoute(
          builder: (_) => DetailPage(
            post: post,
            idUser: idUsers,
            colorUser: colorUsers,
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
