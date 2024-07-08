import 'package:flutter/material.dart';
import '../model/post_model.dart';
import 'dart:math' as math;

class DetailPage extends StatelessWidget {
  final Post post;
  final int idUser;
  final double colorUser;

  const DetailPage(
      {super.key,
      required this.post,
      required this.idUser,
      required this.colorUser});

  @override
  Widget build(BuildContext context) {
    print("post: ${post.id}");

    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://picsum.photos/200/300?random=$idUser"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 120,
                  left: 22,
                  right: 22,
                  bottom: 62,
                ),
                child: Card(
                  color: Color((colorUser * 0xFFFFFF).toInt()).withOpacity(1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: idUser != null
                              ? NetworkImage(
                                  "https://picsum.photos/200/300?random=${idUser}")
                              : Image.asset("https://via.placeholder.com/150/56a8c2")
                                  .image,
                        ),
                        const SizedBox(height: 12,),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(height: 12,),
                        Text(
                          post.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12,),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(height: 12,),
                        Text(
                          post.body,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12,),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(height: 12,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
