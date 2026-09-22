import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/user_controller.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController(), permanent: true);

    return GetMaterialApp(
      title: 'MVC + GetX App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.home,
    );
  }
}
