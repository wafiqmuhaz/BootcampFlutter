import 'package:flutter/material.dart';

import 'home_screen_auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String username = _usernameController.text;
    if (username.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreenAuth(username: username),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sanber Flutter',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('Forgot Password?',
                  style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Does not have account?'),
                SizedBox(width: 5),
                Text('Sign In', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}