import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/album_model.dart';
import '../model/list_album_model.dart';

class MateriServices {
  static Future<Album> fetchAlbum(id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album.');
    }
  }

  // function to fetch data from api and return future list of posts
  static Future<List<Post>> getPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos');
    final response = await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Post.fromJson(e)).toList();
  }
}