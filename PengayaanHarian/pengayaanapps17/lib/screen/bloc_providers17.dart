import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc/news_org_bloc.dart';
import '../providers/news_provider.dart';
import 'news_org_page.dart';

class BlocProviders17 extends StatefulWidget {
  const BlocProviders17({super.key});

  @override
  State<BlocProviders17> createState() => _BlocProviders17State();
}

class _BlocProviders17State extends State<BlocProviders17> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsOrgBloc(NewsServices()),
        ), // BlocProvider
      ],
      child: NewsOrgPage(),
    ); // MultiBlocProvider
  }
}