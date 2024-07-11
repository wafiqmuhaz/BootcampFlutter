import 'package:go_router/go_router.dart';

import '../screen/news_org_page.dart';
import 'class_go_router.dart';

final GoRouter go_router = GoRouter(
  routes: [
    GoRoute(
      path: RouteNames.newsOrgScreen,
      name: RouteNames.newsOrgScreen,
      builder: (context, state) => const NewsOrgPage(),
    ),
  ],
);