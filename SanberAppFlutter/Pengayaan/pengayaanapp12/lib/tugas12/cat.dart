// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CatLandingAnimation extends StatefulWidget {
  const CatLandingAnimation({super.key});

  @override
  _CatLandingAnimationState createState() => _CatLandingAnimationState();
}

class _CatLandingAnimationState extends State<CatLandingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Membuat AnimationController dengan durasi 2 detik
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    ); // AnimationController

    // Membuat animasi berupa translasi vertikal (Y) dari atas ke bawah
    _animation = Tween<double>(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Memulai animasi
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Landing Animation'),
      ), // AppBar
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0.0, _animation.value),
            child: Center(
              child: Image.asset(
                'assets/images/1.jpeg', // Ganti dengan path gambar kucing Anda
                width: 150.0,
                height: 150.0,
              ), // Image.asset
            ), // Center
          ); // Transform.translate
        }, // AnimatedBuilder
      ), // Scaffold
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}