import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/model.dart';
import '../routes/classRouter.dart';

class DetailPage extends StatelessWidget {
  final UserModel user;

  const DetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushNamed(RouteNames.listViewScreen);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 117, 164, 245),
        title: const Text(
          'Detail Page',
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: user.avatar != null
                    ? NetworkImage(
                        "https://picsum.photos/200/300?random=${user.id}")
                    : NetworkImage(user.avatar!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 120,
                bottom: 128.0,
              ),
              child: Card(
                color: const Color.fromARGB(255, 117, 164, 245),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: user.avatar != null
                            ? NetworkImage(user.avatar!)
                            : Image.asset(
                                    "https://via.placeholder.com/150/56a8c2")
                                .image,
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 12),
                      Text(
                        "Name: ${user.firstName} ${user.lastName}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 12),
                      Text(
                        "Email: ${user.email}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
