// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('expect function', () {
    test('expect (value) ✅', () {
      const result = 0;
      expect(result, 0);
    });

    test('expect (value) ❌', () {
      const result = 1;
      expect(result, 0);
    });

    test('expect (reason) ❌', () {
      const result = 1;
      expect(result, 0, reason: 'Result should be 0!');
    });

    test('expect (skip) ✅', () {
      const result = 1;
      expect(result, 0, skip: true);
      expect(result, 0, skip: 'for a reason');
    });
  });
}

