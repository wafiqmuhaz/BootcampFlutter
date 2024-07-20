import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:miniproject_1/model/cart_model.dart';
import 'package:miniproject_1/model/product_model.dart';
import 'package:miniproject_1/model/user_model.dart';
import 'package:miniproject_1/services/api_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  group('API Service Test', () {
    test('fetchUser returns a User object', () async {
      final client = MockClient((request) async {
        return http.Response(
            '{"id": 1, "username": "testuser", "email": "test@example.com"}',
            200);
      });
      final apiService = ApiService(client);

      final user = await apiService.fetchUser();
      expect(user, isA<User>());
      expect(user.username, 'testuser');
      expect(user.email, 'test@example.com');
    });

    test('fetchCart returns a CartModel object', () async {
      final client = MockClient((request) async {
        return http.Response(
            '{"id": 1, "userId": 1, "date": "2020-03-02T00:00:00.000Z", "products": []}',
            200);
      });
      final apiService = ApiService(client);

      final cart = await apiService.fetchCart();
      expect(cart, isA<CartModel>());
      expect(cart.id, 1);
      expect(cart.userId, 1);
    });

    test('fetchProducts returns a list of ProductModel', () async {
      final client = MockClient((request) async {
        return http.Response(
            '[{"id": 1, "title": "Test Product", "price": 29.99}]', 200);
      });
      final apiService = ApiService(client);

      final products = await apiService.fetchProducts();
      expect(products, isA<List<ProductModel>>());
      expect(products.isNotEmpty, true);
      expect(products.first.title, 'Test Product');
    });
  });
}