import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'bloc/drawer_bloc/drawer_bloc.dart';
import 'main_view.dart';
import 'router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: go_router,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => DrawerBloc(),
        ),
      ],
      child: const MainPageView(),
    );
  }
}
