import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService({http.Client? client}) : client = client ?? http.Client();

  static const String productsUrl = 'https://fakestoreapi.com/products';
  static const String jewelryUrl = 'https://fakestoreapi.com/products/category/jewelery';

  Future<List<dynamic>> fetchProducts() async {
    final response = await client.get(Uri.parse(productsUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<dynamic>> fetchJewelry() async {
    final response = await client.get(Uri.parse(jewelryUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load jewelry');
    }
  }
}
