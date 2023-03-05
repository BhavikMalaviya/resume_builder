import 'package:get/get.dart';
import 'package:resume_builder/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.homeScreen);
    });
    super.onInit();
  }
}
