// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:templateapps/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Page and Navigation Tests', () {
    testWidgets('Login Page Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find the username and password TextFields
      final usernameField = find.byKey(const Key('username'));
      final passwordField = find.byKey(const Key('password'));
      final registerButton = find.byKey(const Key('registerButton'));
      final loginButton = find.byKey(const Key('loginButton'));

      // Enter text into the TextFields
      await tester.enterText(usernameField, 'testuser');
      await tester.enterText(passwordField, 'password123');
      await tester.tap(registerButton);
      await tester.pump();

      // Verify the entered text
      expect(find.text('testuser'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);

      // Tap the login button
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify the navigation to the home page
      expect(find.text('Home Page'), findsOneWidget);
    });

    testWidgets('Navigation Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find the username and password TextFields
      final usernameField = find.byKey(const Key('username'));
      final passwordField = find.byKey(const Key('password'));
      final registerButton = find.byKey(const Key('registerButton'));
      final loginButton = find.byKey(const Key('loginButton'));

      // Register and login
      await tester.enterText(usernameField, 'testuser');
      await tester.enterText(passwordField, 'password123');
      await tester.tap(registerButton);
      await tester.pump();
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify the navigation to the home page
      expect(find.text('Home Page'), findsOneWidget);

      // Tap the button to navigate to the second page
      final navigateToSecondPageButton = find.byKey(const Key('navigateToSecondPage'));
      await tester.tap(navigateToSecondPageButton);
      await tester.pumpAndSettle();

      // Verify the navigation to the second page
      expect(find.text('Second Page'), findsOneWidget);
    });
  });
}