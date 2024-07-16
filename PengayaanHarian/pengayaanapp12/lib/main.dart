import 'package:flutter/material.dart';

import 'tugas12/animasi.dart';
import 'tugas12/cat.dart';
import 'tugas12/infinite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 300.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GestureAnimationExample(),
                    ),
                  );
                },
                child: const Text("GestureAnimationExample"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CatLandingAnimation(),
                    ),
                  );
                },
                child: const Text("CatLandingAnimation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfiniteLoopAnimationExample(),
                    ),
                  );
                },
                child: const Text("InfiniteLoopAnimationExample"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
