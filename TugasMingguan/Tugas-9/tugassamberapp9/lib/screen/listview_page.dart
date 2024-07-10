import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../services/user_services.dart';
import '../widgets/drawer_widgets.dart';
import 'account_page.dart';
import 'list_view_Item_page.dart';
import 'setting_page.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => UserBloc(UserRepository())..add(LoadUserEvent()),
          child: Scaffold(
            drawer: const AppDrawer(),
            appBar: AppBar(
              title: const Text('List View'),
              backgroundColor: const Color.fromARGB(255, 86, 146, 250),
            ),
            body: IndexedStack(
                index: state.index,
                children: const [
                  ListViewItemPage(),
                  AccountPage(),
                  SettingPage(),
                ],
              ),
            // ListViewItem(),
            bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) => context.read<BottomNavCubit>().updateIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
          ),
        );
      },
    );
  }
}
