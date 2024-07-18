import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/album_model.dart';
import '../model/list_album_model.dart';
class ApiServices {
  static Future<Album> fetchAlbum(int id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album.');
    }
  }

  static Future<List<Post>> getPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Post.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> postReq({required String title, required String content}) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "body": content}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data.');
    }
  }

  Future<Map<String, dynamic>> putReq({required int id, required String title, required String content}) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id, "title": title, "body": content}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update data.');
    }
  }
}