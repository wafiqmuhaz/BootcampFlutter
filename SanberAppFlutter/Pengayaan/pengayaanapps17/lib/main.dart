import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/news_bloc/news_org_bloc.dart';
import 'providers/news_provider.dart';
import 'router/go_router.dart';
import 'screen/bloc_providers17.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsOrgBloc(NewsServices()),
      child: MaterialApp.router(
        routerConfig: go_router,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       home: BlocProviders17(),
//       // CounterLogicPage(),
//     ); // MaterialApp
//   }
// }
