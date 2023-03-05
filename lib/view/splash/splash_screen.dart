import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controlller/splash/splash_controller.dart';
import 'package:resume_builder/utils/app_assets.dart';
import 'package:resume_builder/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Image.asset(
        AppAssets.logo,
        height: 200,
        width: 100,
      )),
    );
  }
}
