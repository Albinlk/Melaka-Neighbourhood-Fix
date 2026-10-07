import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'core/services/cache_service.dart';
import 'core/services/auth_service.dart';
import 'features/auth/screens/welcome_screen.dart';
import 'features/dashboard/screens/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final cacheService = CacheService();
  await cacheService.init();

  runApp(
    ProviderScope(
      overrides: [
        cacheServiceProvider.overrideWithValue(cacheService),
      ],
      child: const MelakaFixApp(),
    ),
  );
}

class MelakaFixApp extends ConsumerWidget {
  const MelakaFixApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'Melaka Neighbourhood Fix',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: authState.when(
        data: (user) {
          if (user != null) {
            return const MainNavigationScreen();
          }
          return const WelcomeScreen();
        },
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (e, s) => Scaffold(body: Center(child: Text('Error: $e'))),
      ),
    );
  }
}
