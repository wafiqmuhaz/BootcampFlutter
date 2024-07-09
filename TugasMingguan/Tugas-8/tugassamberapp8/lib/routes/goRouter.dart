// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/model.dart';
import '../screen/detail_page.dart';
import '../screen/home_page.dart';
import '../screen/listview_page.dart';
import '../screen/login_page.dart';
import '../screen/splash_page.dart';
import 'classRouter.dart';

final GoRouter go_router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: RouteNames.splashScreen,
      name: RouteNames.splashScreen,
      builder: (BuildContext context, GoRouterState state) => const SplashPage(),
    ),
    GoRoute(
      path: RouteNames.loginScreen,
      name: RouteNames.loginScreen,
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.homeScreen,
      name: RouteNames.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        final username = state.extra as String?;
        return HomePage(username: username!);
      },
    ),
    GoRoute(
      path: RouteNames.listViewScreen,
      name: RouteNames.listViewScreen,
      builder: (BuildContext context, GoRouterState state) => const ListViewPage(),
    ),
    GoRoute(
      path: RouteNames.detailScreen,
      name: RouteNames.detailScreen,
      builder: (BuildContext context, GoRouterState state) {
        final user = state.extra as UserModel;
        return DetailPage(user: user);
      },
    ),
  ],
);
