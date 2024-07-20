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
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text('Sanber Commerce', style: TextStyle(
          color: Colors.black,
        ),),
        leading: IconButton(
          icon: const Icon(
            color: Colors.black,
            Icons.shopping_cart,
            size: 40,
          ),
          onPressed: () {
            context.push(RouteNames.cartScreen);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              color: Colors.black,
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
