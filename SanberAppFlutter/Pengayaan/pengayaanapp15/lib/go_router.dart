part of 'app.dart';

var router_go = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: RouteNames.slashHomeScreen,
      name: RouteNames.homeScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreenPage(),
    ),
    GoRoute(
      path: RouteNames.slashDetailScreen,
      name: RouteNames.detailScreen,
      builder: (BuildContext context, GoRouterState state) {
        final post = state.extra as Post;
        return DetailsScreenPage(post: post);
      },
    ),
  ],
);
