import 'package:flutter/material.dart';
import 'package:resume_builder/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
  );
}
