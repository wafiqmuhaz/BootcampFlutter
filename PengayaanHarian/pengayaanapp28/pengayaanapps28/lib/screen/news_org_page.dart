import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc/news_org_bloc.dart';
import 'dart:math' as math;
import '../models/news_org_model.dart';
import '../providers/news_provider.dart';
import 'news_detail_page.dart';

// class NewsOrgPage extends StatefulWidget {
//   const NewsOrgPage({super.key});

//   @override
//   State<NewsOrgPage> createState() => _NewsOrgPageState();
// }

// class _NewsOrgPageState extends State<NewsOrgPage> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("News Org Page")),
//       body: Container(
//         height: MediaQuery.of(context).size.height / 1,
//         child: BlocProvider(
//           create: (context) =>
//               NewsOrgBloc(NewsServices())..add(LoadNewsEvent()),
//           child: BlocBuilder<NewsOrgBloc, NewsOrgState>(
//             builder: (context, state) {
//               print('State: $state');
//               if (state is NewsLoadingState) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (state is NewsErrorState) {
//                 return const Center(
//                   child: Text('Error loading news'),
//                 );
//               }
//               if (state is NewsLoadedState) {
//                 List<NewsOrgModel> newsModel = state.news;
//                 return Container(
//                   padding: const EdgeInsets.all(10),
//                   child: ListView.builder(
//                     itemCount: newsModel.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         child: ListTile(
//                           leading: newsModel[index].urlToImage != null
//                               ? Image.network(
//                                   newsModel[index].urlToImage!,
//                                   width: 100,
//                                   fit: BoxFit.cover,
//                                 )
//                               : null,
//                           title: Text(newsModel[index].title ?? 'No Title'),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(newsModel[index].author ?? 'Unknown Author'),
//                               SizedBox(height: 5),
//                               Text(
//                                 newsModel[index].description ??
//                                     'No Description',
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                           isThreeLine: true,
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               }
//               return const Center(
//                 child: Text('Unexpected State'),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



// class NewsOrgPage extends StatelessWidget {
//   const NewsOrgPage({super.key});

//   Widget loadingWidget(Widget child, ImageChunkEvent? loadingProgress) {
//     final loadingValue = (loadingProgress?.cumulativeBytesLoaded ?? 0);
//     final expectedValue = (loadingProgress?.expectedTotalBytes ?? 0);

//     if(loadingValue < expectedValue) {
//       return SizedBox(
//         width: 100,
//         child: Center(
//           child: CircularProgressIndicator(
//             value: loadingValue / expectedValue,
//           ),
//         ),
//       );
//     }
//     return child;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Top Headlines'),
//       ),
//       body: FutureBuilder(future: 
//       NewsAPIServices().topHeadlines(), builder: (context, snapshot) {
//         if(snapshot.connectionState == ConnectionState.done) {
//           final data = snapshot.data?.articles ?? [];

//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               final item = data[index];

//               return ListTile(
//                 leading:  ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: Image.network(
//                     item.urlToImage,
//                     width: 100,
//                     loadingBuilder: (context, child, loadingProgress) => loadingWidget(child, loadingProgress),
//                     errorBuilder: (context, error, stackTrace) => Container(width: 100, color: Colors.grey,),
//                   ),

//                 ),
//                 title: Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis,),
//                 subtitle: Text(item.description, maxLines: 1, overflow: TextOverflow.ellipsis,),
//               );

              
//             });
//         } else {
//           return Center(child: CircularProgressIndicator(),);
//         }
//       }),
//     );
//   }
// }

class NewsOrgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: BlocBuilder<NewsOrgBloc, NewsOrgState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoadedState) {
            return ListView.builder(
              itemCount: state.news.articles.length,
              itemBuilder: (context, index) {
                final article = state.news.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Text(article.title),
                    subtitle: Text(article.author),
                    leading: article.urlToImage.isNotEmpty
                        ? Image.network(article.urlToImage)
                        : null,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailPage(article: article),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is NewsErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('Press the button to fetch news'));
          }
        },
      ),
    );
  }
}
