import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/news_bloc/news_org_bloc.dart';
import 'providers/news_provider.dart';
import 'router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsOrgBloc(NewsServices()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: go_router,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}