import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _sendResetLink() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.forgotPassword(
      _emailController.text.trim(),
    );
    setState(() => _isLoading = false);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? 'Reset link sent!' : 'Failed to send link.'),
      ),
    );

    if (success) context.go('/login');
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
                  Icons.lock_reset_rounded,
                  size: 100,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Forgot Password',
                  style: AppTextStyles.bigTitle.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 32),

                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => v!.isEmpty ? 'Enter email' : null,
                ),
                const SizedBox(height: 24),

                AppButton(
                  text: _isLoading ? 'Sending...' : 'Send Reset Link',
                  onPressed: _isLoading ? null : _sendResetLink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
