import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaanfirebase/screens/home.dart';

import '../bloc/auth/authentication_bloc.dart';
import 'sign_In.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'signup_screen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final aboutMeController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    usernameController.dispose();
    addressController.dispose();
    aboutMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create an account',
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('Email address'),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Password'),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const Text('Full Name'),
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your full name',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Username'),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Address'),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your address',
                ),
              ),
              const SizedBox(height: 10),
              const Text('About Me'),
              TextFormField(
                controller: aboutMeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tell us about yourself',
                ),
              ),
              const SizedBox(height: 20),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationSuccessState) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.id,
                      (route) => false,
                    );
                  } else if (state is AuthenticationFailureState) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(state.errorMessage),
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          SignUpUser(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            fullNameController.text.trim(),
                            usernameController.text.trim(),
                            addressController.text.trim(),
                            aboutMeController.text.trim(),
                          ),
                        );
                      },
                      child: Text(
                        state is! AuthenticationLoadingState ? 'Signup' : '.......',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}