import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import 'sign_up.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello User',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationInitialState) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignupScreen.id,
                    (route) => false,
                  );
                } else if (state is AuthenticationLoadingState) {
                  // Show loading indicator or similar
                } else if (state is AuthenticationFailureState) {
                  showDialog(context: context, builder: (context) {
                    return const AlertDialog(
                      content: Text('Error logging out'),
                    );
                  });
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
                    },
                    child: const Text('logOut')
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
