import 'dart:async';
import 'package:flutter/material.dart';
import '../model/album_model.dart';
import '../model/list_album_model.dart';
import '../services/api_services.dart';

Future<List<Post>> postsFuture = ApiServices.getPosts();

class DetailReadDataPage extends StatefulWidget {
  const DetailReadDataPage({
    super.key,
    required this.id,
    required this.imageUser,
  });
  final int id;
  final String imageUser;

  @override
  State<DetailReadDataPage> createState() => _DetailReadDataPageState();
}

class _DetailReadDataPageState extends State<DetailReadDataPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiServices.fetchAlbum(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    print("futureAlbum: $futureAlbum");
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
              future: postsFuture,
              builder: (context, snalbum) {
                
                if (snalbum.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snalbum.hasError) {
                  return Text('Error: ${snalbum.error}');
                } else if (snalbum == null) {
                  return const CircularProgressIndicator();
                } else {
                  return FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      String imgstring = widget.imageUser;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        print("snapshot: ${snapshot.data!.id}");
                        return Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 120,
                                backgroundImage:
                                 imgstring != null
                                    ? NetworkImage(imgstring!)
                                    : Image.asset(
                                            "https://via.placeholder.com/150/56a8c2")
                                        .image,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                snapshot.data!.title,
                                style: const TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ); //Text(snapshot.data!.title);
                      } else {
                        return const Text('No data');
                      }
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}
