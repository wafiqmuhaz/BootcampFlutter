import 'dart:async';

import 'package:flutter/material.dart';

import '../model/list_album_model.dart';
import '../services/api_services.dart';

import 'detail_read.dart';

Future<List<Post>> postsFuture = ApiServices.getPosts();

class ReadDataPage extends StatefulWidget {
  const ReadDataPage({Key? key}) : super(key: key);

  @override
  State<ReadDataPage> createState() => _ReadDataPageState();
}

class _ReadDataPageState extends State<ReadDataPage> {
  late Future<Post> futureAlbum;

  @override
  void initState() {
    super.initState();
    postsFuture = postsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch data list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch List Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: postsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData == null) {
                // until data is fetched, show loader
                return const CircularProgressIndicator();
              }
              // if snapshot.data is null, show indicator
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              // if snapshot.data is null, show indicator
              if (snapshot.hasError) {
                return const Text('Error');
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    print("index: $index");
                    print(snapshot.data![index].id);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(snapshot.data![index].title!),
                            leading:
                                Image.network(snapshot.data![index].thumbnailUrl!),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailReadDataPage(
                                    imageUser: snapshot.data![index].thumbnailUrl!,
                                    id: snapshot.data![index].id!,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Text('Error');
              }
            },
          ),
        ),
      ),
    );
  }
}

// function to display fetched data on screen
Widget buildPosts(List<Post> posts) {
  // ListView.builder to show data in a list
  return ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      final post = posts[index];
      return InkWell(
        onTap: () {
          print(post.id);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      "https://sanbercode.com/assets/img/identity/logo2x.jpg", // Image.network
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(post.title!),
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  "https://sanbercode.com/assets/img/identity/logo2x.jpg", // Image.network
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(post.title!),
              ),
            ],
          ),
        ),
      );
    },
  );
}