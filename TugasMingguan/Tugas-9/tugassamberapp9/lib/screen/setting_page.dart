import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

import '../routes/classRouter.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
                      const Text(
                        "Setting Page",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: const Color.fromARGB(255, 55, 127, 252),
                        title: const Text("Logout"),
                        onTap: () {
                          context.pushReplacementNamed(RouteNames.loginScreen);
                        },
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
