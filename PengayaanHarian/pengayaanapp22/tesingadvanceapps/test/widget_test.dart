// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';

import 'package:templateapps/services/api_services.dart';
void main() {
  final ApiServices services = ApiServices();

  group('API Service Test', () {
    test('Post Request Test', () async {
      final res = await services.postReq(
        title: 'Post Test',
        content: 'Content Test',
      );

      expect(res['title'], 'Post Test');
      expect(res['body'], 'Content Test');
    });

    test('Put Request Test', () async {
      final res = await services.putReq(
        id: 1,
        title: 'Put Test',
        content: 'Content Test',
      );

      expect(res['id'], 1);
      expect(res['title'], 'Put Test');
      expect(res['body'], 'Content Test');
    });
  });
}