// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../model/post_model.dart';

// class DetailsScreenPage extends StatelessWidget {
//   const DetailsScreenPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Details Screen go')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => context.go('/'),
//           child: const Text('Go back to the Home screen'),
//         ),
//       ),
//     );
//   }
// }

class DetailsScreenPage extends StatelessWidget {
  final Post post;

  const DetailsScreenPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorUsers =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen go')),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://picsum.photos/200/300?random=${post.id}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Card(
              color: colorUsers,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: ListView(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: post.id != null
                          ? NetworkImage(
                              "https://picsum.photos/200/300?random=${post.id}")
                          : Image.asset(
                                  "https://via.placeholder.com/150/56a8c2")
                              .image,
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 12),
                    Text(
                      post.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 12),
                    Text(
                      post.body,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 12),
                    const SizedBox(height: 16),
                    Text(
                      'User ID: ${post.userId}',
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Post ID: ${post.id}',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
