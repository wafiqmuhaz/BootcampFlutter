// import 'package:flutter/material.dart';

// import '../models/news_org_model.dart';

// class NewsDetailPage extends StatelessWidget {
//   final NewsOrgModel news;

//   const NewsDetailPage({Key? key, required this.news}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(news.title ?? 'News Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             news.urlToImage != null
//                 ? Image.network(news.urlToImage!)
//                 : SizedBox.shrink(),
//             SizedBox(height: 8),
//             Text(
//               news.title ?? 'No Title',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'By ${news.author ?? 'Unknown Author'}',
//               style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//             ),
//             SizedBox(height: 8),
//             Text(news.description ?? 'No Description'),
//             SizedBox(height: 8),
//             Text(news.content ?? 'No Content'),
//           ],
//         ),
//       ),
//     );
//   }
// }
