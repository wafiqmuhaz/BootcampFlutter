import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../services/api_services.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService;

  HomePage({required this.apiService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 219, 252),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 200, 219, 252),
        title: const Text('Item Store App'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data;
            return ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 22, right: 22,),
                  child: Card(
                    color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                    child: ListTile(
                      leading: Image.network(product['image']),
                      title: Text(product['title']),
                      subtitle: Text('\$${product['price']}'),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

