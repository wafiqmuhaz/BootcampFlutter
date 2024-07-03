import 'package:flutter/material.dart';

import '../../widgets/auth_widgets/grid_item.dart';

class HomeScreenAuth extends StatelessWidget {
  final String username;

  HomeScreenAuth({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text(
              username,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recommended Place',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                buildGridItem("assets/images/1.jpeg"),
                buildGridItem("assets/images/2.jpeg"),
                buildGridItem("assets/images/3.jpeg"),
                buildGridItem("assets/images/4.jpeg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}