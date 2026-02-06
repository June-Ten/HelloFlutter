// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_1/main.dart';

void main() {
  testWidgets('Aspen onboarding navigates to home', (WidgetTester tester) async {
    await tester.pumpWidget(const AspenApp());

    // Onboarding.
    expect(find.text('Aspen'), findsOneWidget);
    expect(find.text('Explore Aspen'), findsOneWidget);

    // Navigate to home.
    await tester.tap(find.text('Explore Aspen'));
    await tester.pumpAndSettle();

    // Home.
    expect(find.text('Explore Aspen'), findsOneWidget);
    expect(find.text('Popular'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
