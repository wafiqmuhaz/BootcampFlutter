import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import '../routers/routers.dart';
import '../services/post_service.dart';
import 'detail_page.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(PostService())..add(LoadPostsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hi $username'),
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
                        Navigator.pushNamed(
                          context,
                          RouteNames.detailScreen,
                          // arguments: {
                          //   'post': post,
                          //   'idUsers': idUsers,
                          //   'colorUsers': colorUsers,
                          // },
                          arguments: [
                            post,
                            idUsers,
                            colorUsers,
                          ],
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
