import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottomNavBackground,
        selectedItemColor: AppColors.bottomNavActive,
        unselectedItemColor: AppColors.bottomNavInactive,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.bigTitle,
        displayMedium: AppTextStyles.mediumTitle,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.smallTitle,
        bodySmall: AppTextStyles.caption,
      ),
      fontFamily: AppTextStyles.fontFamily,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
    );
  }

  // Dark Theme (optional)
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.bigTitle.copyWith(color: Colors.white),
        displayMedium: AppTextStyles.mediumTitle.copyWith(color: Colors.white),
        bodyLarge: AppTextStyles.body.copyWith(color: Colors.white70),
        bodyMedium: AppTextStyles.smallTitle.copyWith(color: Colors.white60),
        bodySmall: AppTextStyles.caption.copyWith(color: Colors.white54),
      ),
    );
  }
}
