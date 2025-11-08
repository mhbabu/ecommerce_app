import 'package:ecommerce_app/features/auth/ui/register_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/ui/splash_screen.dart';
import '../features/auth/ui/login_screen.dart';
import '../features/home/ui/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
