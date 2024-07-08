import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import '../services/post_service.dart';
import 'detail_page.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(PostService())..add(LoadPostsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mengambil data Posts dengan Bloc'),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoadedState) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  int idUsers = post.id;
                  double colorUsers = math.Random().nextDouble();
                  print("colorUsers: $colorUsers");
                  return Card(
                    color:
                        Color((colorUsers * 0xFFFFFF).toInt()).withOpacity(1.0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              post: post,
                              idUser: idUsers,
                              colorUser: colorUsers,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is PostErrorState) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: Text('Unknown error'));
            }
          },
        ),
      ),
    );
  }
}
