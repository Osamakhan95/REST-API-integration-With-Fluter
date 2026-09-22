import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:basic_flutter_app_getx_mvc/services/user_service.dart';

class _FakeClient extends http.BaseClient {
  Uri? requestedUri;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    requestedUri = request.url;
    final body = jsonEncode([
      {'id': 1, 'name': 'Ali', 'email': 'ali@example.com', 'age': 22},
    ]);

    return http.StreamedResponse(
      Stream.value(utf8.encode(body)),
      200,
      headers: {'content-type': 'application/json'},
    );
  }
}

void main() {
  test('fetches and decodes users from the API endpoint', () async {
    final client = _FakeClient();
    final service = UserService(
      client: client,
      baseUrl: 'http://api.example.com/',
    );

    final users = await service.fetchUsers();

    expect(client.requestedUri.toString(), 'http://api.example.com/api/users');
    expect(users.single.name, 'Ali');
    expect(users.single.age, 22);
  });
}
