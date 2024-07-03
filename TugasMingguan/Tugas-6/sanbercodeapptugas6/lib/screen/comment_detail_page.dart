// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

import '../model/comment_model.dart';

class CommentDetailPage extends StatelessWidget {
  final Comment comment;
  final int id;
  final int randuser;

  const CommentDetailPage({
    super.key,
    required this.comment,
    required this.id,
    required this.randuser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment Detail User ${id.toString()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 1,
              shadowColor: const Color.fromARGB(0, 73, 73, 73),
              color: Colors.primaries[randuser],
              shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 22.0,
                  right: 22.0,
                  top: 42,
                  bottom: 42,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          120,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 120,
                        backgroundImage: id != null
                            ? NetworkImage(
                                "https://picsum.photos/200/300?random=${id}")
                            : Image.asset(
                                    "https://via.placeholder.com/150/56a8c2")
                                .image,
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 22),
                    Text(
                      comment.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 22),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Email: ${comment.email}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      comment.body,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
