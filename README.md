# basic_flutter_app_getx_mvc

A new Flutter project.

## REST API

The users screen requests `GET /api/users` through `UserService`, using
`http://localhost:3000` by default.

For an Android emulator, point Flutter at the host machine with:

```shell
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3000
```

The API response should be a JSON array containing `id`, `name`, `email`, and
`age` fields.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
