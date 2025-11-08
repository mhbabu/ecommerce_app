import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash duration

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.token != null) {
      // User logged in → go home
      context.go('/home');
    } else {
      // Not logged in → go login
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          'Shoply',
          style: AppTextStyles.bigTitle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
