import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/comment_model.dart';

class CommentService {
  static const String url = 'https://jsonplaceholder.typicode.com/comments';

  static Future<List<Comment>> fetchComments() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
