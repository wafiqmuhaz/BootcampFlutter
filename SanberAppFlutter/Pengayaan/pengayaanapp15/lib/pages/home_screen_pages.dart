// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../class_go_route.dart';
import '../model/post_model.dart';
import '../services/post_service.dart';

// class HomeScreenPage extends StatelessWidget {
//   const HomeScreenPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen go')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => context.go('/details'),
//           child: const Text('Go to the Details screen'),
//         ),
//       ),
//     );
//   }
// }

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = PostService().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen go')),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                int idUsers = post.id;
                Color colorUsers =
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0);

                return Card(
                  color: colorUsers,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 32,
                      backgroundImage: idUsers != null
                          ? NetworkImage(
                              "https://picsum.photos/200/300?random=${idUsers}")
                          : Image.asset(
                                  "https://via.placeholder.com/150/56a8c2")
                              .image,
                    ),
                    title: Text(
                      post.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(post.body),
                    onTap: () {
                      context.pushNamed(RouteNames.detailScreen, extra: post);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No posts found'));
          }
        },
      ),
    );
  }
}
