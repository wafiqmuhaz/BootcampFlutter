// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';

class GestureAnimationExample extends StatefulWidget {
  const GestureAnimationExample({super.key});

  @override
  _GestureAnimationExampleState createState() =>
      _GestureAnimationExampleState();
}

class _GestureAnimationExampleState
    extends State<GestureAnimationExample> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.blue;

  void _randomizeContainer() {
    final random = Random();

    setState(() {
      _width = random.nextDouble() * 200 + 100; // Width between 100 and 300
      _height = random.nextDouble() * 200 + 100; // Height between 100 and 300
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ); // Random color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _randomizeContainer,
          child: AnimatedContainer(
            width: _width,
            height: _height,
            color: _color,
            alignment: Alignment.center,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Text(
              'Tap Me',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}