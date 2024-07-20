import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == 'wafiqmuhaz' && _passwordController.text == 'superbootcamp') {
      context.pushReplacementNamed(RouteNames.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan password tidak sesuai')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: const Key('username'),
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'wafiqmuhaz'),
            ),
            TextField(
              key: const Key('password'),
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'superbootcamp'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('loginButton'),
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
