import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Community Impact Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.auto_awesome, size: 16, color: AppColors.onSecondaryContainer),
                    const SizedBox(width: 8),
                    Text(
                      'Community Impact: 1,240 Fixed',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Selamat Datang,\nWarga Melaka!',
                style: AppTextStyles.headlineLarge.copyWith(
                  color: AppColors.primary,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your voice matters in keeping our historic city beautiful. Join your neighbours in reporting and resolving local issues quickly and efficiently.',
                style: AppTextStyles.bodyLarge.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 48),
              
              // Feature list
              _buildFeatureItem(
                context,
                icon: Icons.camera_alt_outlined,
                title: 'Snap & Fix',
                description: 'Report issues in seconds with a quick photo.',
              ),
              const SizedBox(height: 24),
              _buildFeatureItem(
                context,
                icon: Icons.map_outlined,
                title: 'Live Track',
                description: 'Watch progress in real-time on your map.',
              ),
              
              const Spacer(),
              
              // Social Proof
              Center(
                child: Text(
                  '+ 5,000 active citizens reported this week',
                  style: AppTextStyles.labelLarge.copyWith(color: AppColors.secondary),
                ),
              ),
              const SizedBox(height: 24),
              
              // Primary Action
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text('Get Started'),
              ),
              const SizedBox(height: 12),
              
              // Secondary Action
              Center(
                child: TextButton(
                  onPressed: () {
                    // TODO: Anonymous Sign In
                  },
                  child: Text(
                    'Continue as Guest',
                    style: AppTextStyles.labelLarge.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Footer
              Center(
                child: Text(
                  'Supported by Majlis Bandaraya Melaka Bersejarah (MBMB)',
                  style: AppTextStyles.labelSmall.copyWith(color: AppColors.outline),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.titleLarge),
              const SizedBox(height: 4),
              Text(description, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
        ),
      ],
    );
  }
}
