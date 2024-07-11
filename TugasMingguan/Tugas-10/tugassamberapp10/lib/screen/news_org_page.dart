// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/news_bloc/news_org_bloc.dart';
import 'dart:math' as math;
import '../models/news_org_model.dart';
import '../providers/news_provider.dart';

class NewsOrgPage extends StatefulWidget {
  const NewsOrgPage({super.key});

  @override
  State<NewsOrgPage> createState() => _NewsOrgPageState();
}

class _NewsOrgPageState extends State<NewsOrgPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Org Page")),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        child: BlocProvider(
          create: (context) =>
              NewsOrgBloc(NewsServices())..add(LoadNewsEvent()),
          child: BlocBuilder<NewsOrgBloc, NewsOrgState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NewsErrorState) {
                return const Center(
                  child: Text('Error loading news'),
                );
              }
              if (state is NewsLoadedState) {
                List<NewsOrgModel> newsModel = state.news;
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: newsModel.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: newsModel[index].urlToImage != null
                              ? Image.network(
                                  newsModel[index].urlToImage!,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )
                              : null,
                          title: Text(newsModel[index].title ?? 'No Title'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(newsModel[index].author ?? 'Unknown Author'),
                              const SizedBox(height: 5),
                              Text(
                                newsModel[index].description ?? 'No Description',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Published at: ${newsModel[index].publishedAt ?? 'Unknown'}',
                                style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          onTap: () {
                            if (newsModel[index].url != null) {
                              launch(newsModel[index].url!);
                            }
                          },
                          isThreeLine: true,
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: Text('Unexpected State'),
              );
            },
          ),
        ),
      ),
    );
  }
}
