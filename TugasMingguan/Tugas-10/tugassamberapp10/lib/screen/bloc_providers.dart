import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc/news_org_bloc.dart';
import '../providers/news_provider.dart';
import 'news_org_page.dart';

class BlocProviders extends StatefulWidget {
  const BlocProviders({super.key});

  @override
  State<BlocProviders> createState() => _BlocProvidersState();
}

class _BlocProvidersState extends State<BlocProviders> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsOrgBloc(NewsServices()),
        ),
      ],
      child: const NewsOrgPage(),
    );
  }
}