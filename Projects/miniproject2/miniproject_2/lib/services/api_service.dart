import 'package:http/http.dart' as http;
import 'package:miniproject_1/model/cart_model.dart';
import 'package:miniproject_1/model/product_model.dart';
import 'dart:convert';

import '../model/user_model.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com';
  final http.Client client;

  ApiService(this.client);

  Future<User> fetchUser() async {
    final response = await client.get(Uri.parse('$baseUrl/users/1'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<CartModel> fetchCart() async {
    final response = await client.get(Uri.parse('$baseUrl/carts/1'));
    if (response.statusCode == 200) {
      return CartModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load cart');
    }
  }

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load Product');
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    final response = await client.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
