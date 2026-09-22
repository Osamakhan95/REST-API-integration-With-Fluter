import 'package:get/get.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();

  final RxList<UserModel> users = <UserModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      users.assignAll(await _userService.fetchUsers());
    } catch (error) {
      errorMessage.value = 'Could not load users. ${_messageFor(error)}';
    } finally {
      isLoading.value = false;
    }
  }

  String _messageFor(Object error) {
    if (error is FormatException) return error.message;
    return error.toString().replaceFirst('Exception: ', '');
  }
}
