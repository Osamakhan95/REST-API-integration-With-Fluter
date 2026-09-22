import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
        actions: [
          Obx(
            () => IconButton(
              onPressed: userController.isLoading.value
                  ? null
                  : userController.fetchUsers,
              tooltip: 'Refresh users',
              icon: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (userController.isLoading.value && userController.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userController.errorMessage.isNotEmpty &&
            userController.users.isEmpty) {
          return _ErrorState(
            message: userController.errorMessage.value,
            onRetry: userController.fetchUsers,
          );
        }

        if (userController.users.isEmpty) {
          return const Center(child: Text('No users found.'));
        }

        return RefreshIndicator(
          onRefresh: userController.fetchUsers,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: userController.users.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final user = userController.users[index];
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    child: Text(user.name[0].toUpperCase()),
                  ),
                  title: Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('${user.email}\nAge: ${user.age}'),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
