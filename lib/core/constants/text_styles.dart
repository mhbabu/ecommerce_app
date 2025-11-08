import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Poppins';

  static TextStyle bigTitle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static TextStyle mediumTitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static TextStyle smallTitle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
  );

  static TextStyle body = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static TextStyle caption = const TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
  );
}
