import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAdminStats(context),
            const SizedBox(height: 32),
            Text('Triage Queue', style: AppTextStyles.headlineMedium),
            const SizedBox(height: 8),
            Text('Needs immediate review and assignment', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 20),
            _buildTriageList(context),
            const SizedBox(height: 32),
            _buildDepartmentOverview(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminStats(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildSimpleStat('New', '24', AppColors.info)),
        const SizedBox(width: 12),
        Expanded(child: _buildSimpleStat('Urgent', '5', AppColors.error)),
        const SizedBox(width: 12),
        Expanded(child: _buildSimpleStat('Overdue', '3', AppColors.warning)),
      ],
    );
  }

  Widget _buildSimpleStat(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.headlineMedium.copyWith(color: color)),
        ],
      ),
    );
  }

  Widget _buildTriageList(BuildContext context) {
    return Column(
      children: [
        _buildTriageCard(
          'Severe Pothole',
          'Bukit Baru',
          '9/10',
          'Safety hazard for motorcyclists',
          '15m ago',
          AppColors.error,
        ),
        const SizedBox(height: 16),
        _buildTriageCard(
          'Broken Drain Cover',
          'Klebang',
          '8/10',
          'Trip hazard in commercial area',
          '1h ago',
          AppColors.error,
        ),
        const SizedBox(height: 16),
        _buildTriageCard(
          'Vandalized Park Bench',
          'Ujong Pasir',
          '3/10',
          'Minor cosmetic damage',
          '3h ago',
          AppColors.info,
        ),
      ],
    );
  }

  Widget _buildTriageCard(String title, String location, String score, String reason, String time, Color priorityColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('AI SCORE: $score', style: AppTextStyles.labelSmall.copyWith(color: priorityColor, fontWeight: FontWeight.bold)),
              ),
              Text(time, style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.titleLarge),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 14, color: AppColors.onSurfaceVariant),
              const SizedBox(width: 4),
              Text(location, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.psychology_outlined, size: 20, color: AppColors.primary),
                const SizedBox(width: 12),
                Expanded(child: Text(reason, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic))),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('View Report'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Assign'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentOverview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Department Workload', style: AppTextStyles.titleLarge),
        const SizedBox(height: 16),
        _buildDeptRow('Public Works', 0.8, AppColors.error),
        const SizedBox(height: 12),
        _buildDeptRow('Sanitation', 0.4, AppColors.secondary),
        const SizedBox(height: 12),
        _buildDeptRow('Landscaping', 0.2, AppColors.info),
      ],
    );
  }

  Widget _buildDeptRow(String name, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: AppTextStyles.bodyMedium),
            Text('${(value * 100).toInt()}%', style: AppTextStyles.labelSmall),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: value, color: color, backgroundColor: AppColors.surfaceVariant),
      ],
    );
  }
}
