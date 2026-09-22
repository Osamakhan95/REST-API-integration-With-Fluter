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

## Run the API

Start the included Node.js API from the project root:

```shell
cd Node_JS_Series
npm install
node server.js
```

The API listens on `http://localhost:3000` and enables CORS for the Flutter web
client.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## REST API Integration with Flutter
This project demonstrates using a Flutter application with a REST API and fetching data using GetX state management.
