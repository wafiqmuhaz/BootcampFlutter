// ignore_for_file: library_private_types_in_public_api
import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../model/comment_model.dart';
import '../service/comment_service.dart';
import 'comment_detail_page.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late Future<List<Comment>> futureComments;

  @override
  void initState() {
    super.initState();
    futureComments = CommentService.fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: FutureBuilder<List<Comment>>(
        future: futureComments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No comments found'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final comment = snapshot.data![index];
              final idUser = comment.id;
              final randUser = math.Random().nextInt(Colors.primaries.length);
              print("randUser: $randUser");
              return Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Card(
                    elevation: 22,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.primaries[randUser],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 32,
                          backgroundImage: idUser != null
                              ? NetworkImage(
                                  "https://picsum.photos/200/300?random=${idUser}")
                              : Image.asset(
                                      "https://via.placeholder.com/150/56a8c2")
                                  .image,
                        ),
                        title: Text(comment.email),
                        subtitle: Text(comment.name),
                        trailing: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 75, 75, 75),
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          height: 42,
                          width: 100,
                          child: Center(
                            child: Text(
                              "Detail info : ${idUser}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentDetailPage(
                                randuser: randUser,
                                id: comment.id,
                                comment: comment,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
