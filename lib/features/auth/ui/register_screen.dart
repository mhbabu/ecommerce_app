import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.register({
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim(),
    });

    setState(() => _isLoading = false);

    if (!mounted) return;

    if (success) {
      context.go('/verify-email');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration failed! Try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  Icons.shopping_cart_rounded,
                  size: 100,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Create Account',
                  style: AppTextStyles.bigTitle.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 32),

                AppTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  prefixIcon: const Icon(Icons.person),
                  validator: (v) => v!.isEmpty ? 'Enter name' : null,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => v!.isEmpty ? 'Enter email' : null,
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  validator: (v) => v!.isEmpty ? 'Enter password' : null,
                ),
                const SizedBox(height: 24),

                AppButton(
                  text: _isLoading ? 'Loading...' : 'Register',
                  onPressed: _isLoading ? null : _register,
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => context.go('/login'),
                      child: Text(
                        'Login',
                        style: AppTextStyles.mediumTitle.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
