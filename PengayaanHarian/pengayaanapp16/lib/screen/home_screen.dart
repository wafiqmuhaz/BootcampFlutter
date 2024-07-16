// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../model/post_model.dart';
import '../services/post_service.dart';
import '../widgets/drawer_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = PostService().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer and Bottom Nav with Bloc'),
      ),
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
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No posts found'));
          }
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
