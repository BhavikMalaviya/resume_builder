import 'package:get/get.dart';
import 'package:resume_builder/routes/app_routes.dart';
import 'package:resume_builder/view/add_resume/add_resume_screen.dart';
import 'package:resume_builder/view/home/home_screen.dart';
import 'package:resume_builder/view/splash/splash_screen.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
    GetPage(name: AppRoutes.addResumeScreen, page: () => AddResumeScreen()),
  ];
}
