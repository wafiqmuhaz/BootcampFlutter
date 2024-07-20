import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miniproject_1/pages/product_page/product_page.dart';
import 'package:miniproject_1/routes/routes_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My E-commerce App'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_basket,
              size: 40,
            ),
            onPressed: () {
              context.push(RouteNames.cartScreen);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person,
              size: 40,
            ),
            onPressed: () {
              context.push(RouteNames.userScreen);
            },
          ),
        ],
      ),
      body: const ProductPage(),
    );
  }
}
