// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../const/const.dart';
import '../../routes/routes_name.dart';

//Halaman Splash setelah 3 detik
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    //ANIMASI
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(); // AnimationController
    //DELAY 6 DETIK
    Future.delayed(const Duration(seconds: 6), () {
      context.go(RouteNames.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              ConstNames.sanberLogo,
            ),
          ),
        ),
      ),
    );
  }
}
