import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/news_org_model.dart';

class NewsServices {
  Future<List<NewsOrgModel>> getNews() async {
    String baseUrl = "https://newsapi.org/v2/everything";
    Map<String, String> queryParams = {
      'q': 'apple',
      'from': '2024-06-11',
      'to': '2024-06-11',
      'sortBy': 'popularity',
      'apiKey': '290ecc9cb37b44138a519c6026297263',
    };

    String queryString = Uri(queryParameters: queryParams).query;

    // Combine the base URL and the encoded query string to form the complete URL
    String apiUrl = '$baseUrl?$queryString';

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
