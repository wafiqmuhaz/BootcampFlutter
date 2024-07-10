import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screen/account_page.dart';
import '../screen/home_screen.dart';
import '../screen/second_page.dart';
import '../screen/setting_page.dart';
import 'class_router.dart';

final GoRouter go_router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => const MainPage(),
      routes: [
        GoRoute(
          path: RouteNames.mainScreen,
          name: RouteNames.mainScreen,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: RouteNames.accountScreen,
          name: RouteNames.accountScreen,
          builder: (context, state) => const AccountPage(),
        ),
        GoRoute(
          path: RouteNames.settingScreen,
          name: RouteNames.settingScreen,
          builder: (context, state) => const SettingPage(),
        ),
        GoRoute(
          path: RouteNames.secondScreen,
          name: RouteNames.secondScreen,
          builder: (context, state) => SecondPage(
            params: state.uri.queryParameters,
          ),
        ),
      ],
    ),
  ],
);