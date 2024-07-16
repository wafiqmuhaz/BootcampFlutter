import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final Map<String, String> params;

  const SecondPage({required this.params, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text('Second Page with params: ${params['key']}'),
      ),
    );
  }
}
