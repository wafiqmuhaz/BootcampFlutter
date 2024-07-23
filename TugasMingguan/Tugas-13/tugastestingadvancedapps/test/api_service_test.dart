import 'package:flutter_test/flutter_test.dart';
import 'package:templateapps/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  final apiService = ApiService();

  group(
    'API Service Test',
    () {
      test('fetchProducts returns a list of products', () async {
        final products = await apiService.fetchProducts();
        expect(products, isA<List<dynamic>>());
        expect(products.isNotEmpty, true);
      });

      test('fetchJewelry returns a list of jewelry items', () async {
        final jewelry = await apiService.fetchJewelry();
        expect(jewelry, isA<List<dynamic>>());
        expect(jewelry.isNotEmpty, true);
      });
    },
  );
}

//TESTING WITH MOCK

// void main() {
//   group('API Service Test', () {
//     test('fetchProducts returns a list of products', () async {
//       final mockApiService = ApiService(client: MockClient((request) async {
//         return http.Response(
//             '[{"id":1,"title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category":"men\'s clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating":{"rate":3.9,"count":120}},'
//             '{"id":2,"title":"Mens Casual Premium Slim Fit T-Shirts ","price":22.3,"description":"Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.","category":"men\'s clothing","image":"https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg","rating":{"rate":4.1,"count":259}}]',
//             200);
//       }));

//       final products = await mockApiService.fetchProducts();
//       expect(products, isA<List<dynamic>>());
//       expect(products.isNotEmpty, true);
//     });

//     test('fetchJewelry returns a list of jewelry items', () async {
//       final mockApiService = ApiService(client: MockClient((request) async {
//         return http.Response(
//             '[{"id":5,"title":"John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet","price":695,"description":"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.","category":"jewelery","image":"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg","rating":{"rate":4.6,"count":400}},'
//             '{"id":6,"title":"Solid Gold Petite Micropave ","price":168,"description":"Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.","category":"jewelery","image":"https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg","rating":{"rate":3.9,"count":70}}]',
//             200);
//       }));

//       final jewelry = await mockApiService.fetchJewelry();
//       expect(jewelry, isA<List<dynamic>>());
//       expect(jewelry.isNotEmpty, true);
//     });
//   });
// }