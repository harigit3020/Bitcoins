import 'package:bitcoins/features/bitcoins_rates/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets('find main two widgets in the widget tree',
      (widgetTester) async {
    //arrange
    await widgetTester.pumpWidget(_makeTestableWidget(LoginPage()));

    //act
    var textField = find.byType(TextFormField);
    var button = find.byType(ElevatedButton);

    //assert
    expect(textField, findsOneWidget);
    expect(button, findsOneWidget);
  });
}
