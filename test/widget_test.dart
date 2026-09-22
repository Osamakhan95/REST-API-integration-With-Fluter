// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:basic_flutter_app_getx_mvc/models/user_model.dart';

void main() {
  test('decodes an API user response', () {
    final user = UserModel.fromJson({
      'id': 1,
      'name': 'Ali',
      'email': 'ali@example.com',
      'age': 22,
    });

    expect(user.name, 'Ali');
    expect(user.email, 'ali@example.com');
    expect(user.age, 22);
  });
}
