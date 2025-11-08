import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/auth_provider.dart';
import 'core/themes/app_theme.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyEcommerceApp());
}

class MyEcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp.router(
        title: 'Shoply',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router, // from GoRouter
      ),
    );
  }
}
