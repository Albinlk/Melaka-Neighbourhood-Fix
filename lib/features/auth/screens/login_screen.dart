import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onBackground),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Melaka Fix',
              style: AppTextStyles.headlineLarge.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 8),
            Text(
              'Connecting residents with the Historic City Council.',
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(height: 48),
            
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'e.g. name@example.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot?',
                    style: AppTextStyles.labelLarge.copyWith(color: AppColors.secondary),
                  ),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            
            FilledButton(
              onPressed: () {
                // TODO: Sign In Logic
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 24),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to Melaka Fix? ',
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to Registration
                  },
                  child: Text(
                    'Register Account',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 64),
            Center(
              child: Column(
                children: [
                  Text(
                    'Better Cities, Together.',
                    style: AppTextStyles.titleLarge.copyWith(color: AppColors.outline),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join over 50,000 Melaka residents.',
                    style: AppTextStyles.labelSmall.copyWith(color: AppColors.outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
