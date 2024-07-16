// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class InfiniteLoopAnimationExample extends StatefulWidget {
  const InfiniteLoopAnimationExample({super.key});

  @override
  _InfiniteLoopAnimationExampleState createState() =>
      _InfiniteLoopAnimationExampleState();
}

class _InfiniteLoopAnimationExampleState
    extends State<InfiniteLoopAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Membuat AnimationController dengan durasi 2 detik dan repeat infinite
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // AnimationController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Loop Animation Example'),
      ), // AppBar
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Spinning',
                style: TextStyle(color: Colors.white),
              ),
            ), // Text
          ), // Container
        ), // RotationTransition
      ), // Center
    ); // Scaffold
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}