import 'dart:convert';
import 'package:http/http.dart';
import '../models/news_org_model.dart';

class NewsServices {
  Future<List<NewsOrgModel>> getNews() async {
    String apiUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=290ecc9cb37b44138a519c6026297263";

    Response response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      print(result);
      return result.map((e) => NewsOrgModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
