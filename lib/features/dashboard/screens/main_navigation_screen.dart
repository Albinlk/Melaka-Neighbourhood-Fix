import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/dashboard/screens/home_screen.dart';
import '../features/map/screens/public_map_screen.dart';
import '../features/complaints/screens/submit_complaint_screen.dart';
import '../features/complaints/screens/my_complaints_screen.dart';
import '../features/settings/screens/settings_screen.dart';
import '../core/constants/app_colors.dart';

final navigationIndexProvider = StateProvider<int>((ref) => 0);

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);

    final List<Widget> screens = [
      const HomeScreen(),
      const PublicMapScreen(),
      const SubmitComplaintScreen(), // This will likely be a full-screen flow, but can be a tab for now
      const MyComplaintsScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          if (index == 2) {
            // Special handling for Submit Complaint if it's a modal/full-screen
            _showSubmitFlow(context);
          } else {
            ref.read(navigationIndexProvider.notifier).state = index;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            selectedIcon: Icon(Icons.add_circle),
            label: 'Submit',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history),
            label: 'Reports',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _showSubmitFlow(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SubmitComplaintScreen()),
    );
  }
}
