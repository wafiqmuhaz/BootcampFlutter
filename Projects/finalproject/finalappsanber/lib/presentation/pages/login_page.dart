import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:finalappsanber/common/routes.dart';
import 'package:finalappsanber/common/styles.dart';
import 'package:finalappsanber/presentation/blocs/auth/auth_bloc.dart';

import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginAsVendorAuthenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, vendorHomeRoute, (_) => false);
          } else if (state is LoginAsMemberAuthenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, memberHomeRoute, (_) => false);
          } else if (state is AuthFailure) {
            if (state.message != '') {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
            }
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 24,
              right: 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Sanber POS POS App',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: navyColor,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                 
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            LoginWithEmailSubmitted(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Login'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text('Don’t have an account? Register here'),
                    ),
                  ),

                  // const SizedBox(height: 8),
                  // const Text(
                  //   'Silahkan login terlebih dahulu sebagai vendor atau member untuk melanjutkan.',
                  // ),
                  // const SizedBox(height: 80),
                  // Center(
                  //   child: Container(
                  //     width: 180,
                  //     height: 180,
                  //     decoration: BoxDecoration(
                  //       image: const DecorationImage(
                  //         image: AssetImage('assets/logo/logo.png'),
                  //       ),
                  //       borderRadius: BorderRadius.circular(16),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 80),
                  // _LoginButton(
                  //   onPressed: state is AuthLoading
                  //       ? null
                  //       : () => context.read<AuthBloc>().add(LoginSubmitted()),
                  //   text: 'Log in by Google Account',
                  // ),
                  // state is AuthLoading
                  //     ? Container(
                  //         margin: const EdgeInsets.only(top: 24),
                  //         child: const Center(
                  //           child: CircularProgressIndicator(),
                  //         ),
                  //       )
                  //     : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.onPressed,
    required this.text,
  });

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: FaIcon(FontAwesomeIcons.google),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
