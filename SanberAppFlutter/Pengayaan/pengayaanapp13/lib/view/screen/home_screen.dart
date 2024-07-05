import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc/user_bloc.dart';
import '../../model/model.dart';
import '../../services/user_services.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ), // BlocProvider
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Fetch API With Bloc')),
        body: blocBody(), // Scaffold
      ), // MultiBlocProvider
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(
        UserRepository(),
      )..add(LoadUserEvent()), // UserBloc
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Center
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (__, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text(
                        '${userList[index].firstName} ${userList[index].lastName}',
                        style: const TextStyle(color: Colors.white),
                      ), // Text
                      subtitle: Text(
                        '${userList[index].email}',
                        style: const TextStyle(color: Colors.white),
                      ), // Text
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          userList[index].avatar.toString(),
                        ), // NetworkImage
                      ), // CircleAvatar // ListTile // Card
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text("Error");
          }
        },
      ), // BlocBuilder
    );
  }
}
