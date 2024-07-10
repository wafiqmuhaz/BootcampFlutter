import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'screen/account_page.dart';
import 'screen/home_screen.dart';
import 'screen/setting_page.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.index,
            children: const [
              HomePage(),
              AccountPage(),
              SettingPage(),
            ],
          ),
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
        );
      },
    );
  }
}
