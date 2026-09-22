import 'package:get/get.dart';

import '../views/home_view.dart';
import '../views/profile_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String profile = '/profile';

  static final List<GetPage> pages = [
    GetPage(name: home, page: () => HomeView()),
    GetPage(name: profile, page: () => const ProfileView()),
  ];
}
