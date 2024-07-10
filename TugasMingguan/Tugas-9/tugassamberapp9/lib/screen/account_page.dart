import 'package:flutter/material.dart';
import 'dart:math' as math;

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    double intRand = math.Random().nextDouble();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://picsum.photos/200/300?random=$intRand"),
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
                        backgroundImage: NetworkImage(
                            "https://picsum.photos/200/300?random=$intRand"),
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 90),
                      const Text(
                        "Account Page",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
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
