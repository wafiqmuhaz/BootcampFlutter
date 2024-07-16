import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class PostService {
  final String postUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(postUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
