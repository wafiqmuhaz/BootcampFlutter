import 'package:go_router/go_router.dart';

import '../screen/news_org_page.dart';

final GoRouter go_router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => NewsOrgPage(),
    ),
    // GoRoute(
    //   path: '/detail',
    //   builder: (context, state) {
    //     final news = state.extra as NewsOrgModel;
    //     return NewsDetailPage(news: news);
    //   },
    // ),
  ],
);