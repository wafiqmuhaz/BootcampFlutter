import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../bloc/user_bloc/user_bloc.dart';
import '../routes/classRouter.dart';
import '../services/user_services.dart';

//Halaman Listview page dengan teks "Listview dari pengayaan 13"
class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List View'),
          backgroundColor: const Color.fromARGB(255, 86, 146, 250),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://picsum.photos/200/300?random=${math.Random().nextDouble()}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoadedState) {
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Card(
                          color: Theme.of(context).primaryColor,
                          child: ListTile(
                            title: Text(
                              '${user.firstName!} ${user.lastName!}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${user.email}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                user.avatar.toString(),
                              ),
                            ),
                            onTap: () {
                              context.pushNamed(RouteNames.detailScreen,
                                  extra: user);
                            },
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is UserErrorState) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return const Center(child: Text('Something went wrong!'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
