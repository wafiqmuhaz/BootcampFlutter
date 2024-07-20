import 'package:go_router/go_router.dart';
import 'package:miniproject_1/model/product_model.dart';
import 'package:miniproject_1/pages/cart_page/cart_page.dart';
import 'package:miniproject_1/pages/home_page/home_page.dart';
import 'package:miniproject_1/pages/login_page/login_page.dart';
import 'package:miniproject_1/pages/product_page/product_detail_page.dart';
import 'package:miniproject_1/pages/user_page/user_page.dart';
import 'package:miniproject_1/routes/routes_name.dart';

import '../pages/splash_page/splash_page.dart';

class AppRouter {
  static final AppRouter shared = AppRouter._internal();
  factory AppRouter() {
    return shared;
  }
  AppRouter._internal();

  final router = GoRouter(routes: [
    GoRoute(
      path: RouteNames.splashScreen,
      name: RouteNames.splashScreen,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RouteNames.loginScreen,
      name: RouteNames.loginScreen,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: RouteNames.home,
      path: RouteNames.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        name: RouteNames.detailProduct,
        path: RouteNames.detailProduct,
        builder: (context, state) {
          final product = ProductModel.fromMap(state.uri.queryParameters);
          return ProductDetailPage(product: product);
        }),
    GoRoute(
        name: RouteNames.cartScreen,
        path: RouteNames.cartScreen,
        builder: (context, state) => const CartPage()),
    GoRoute(
        name: RouteNames.userScreen,
        path: RouteNames.userScreen,
        builder: (context, state) => const UserPage()),
  ]);
}
