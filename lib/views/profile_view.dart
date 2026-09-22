import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Obx(() {
          final users = userController.users;
          if (users.isEmpty) {
            return const Text('No user profile available.');
          }

          final user = users.first;
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),
                const SizedBox(height: 20),
                Text(
                  'Name: ${user.name}',
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 10),
                Text(
                  'Email: ${user.email}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text('Age: ${user.age}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
