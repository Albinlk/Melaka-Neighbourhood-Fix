import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../complaints/providers/complaint_providers.dart';
import '../../../models/complaint.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaintsAsync = ref.watch(complaintsStreamProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreeting(context),
                  const SizedBox(height: 24),
                  _buildStatsGrid(context),
                  const SizedBox(height: 32),
                  _buildSubmitCTA(context),
                  const SizedBox(height: 32),
                  _buildRecentReportsHeader(context),
                  const SizedBox(height: 16),
                  complaintsAsync.when(
                    data: (complaints) => _buildRecentReportsList(context, complaints),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, s) => Text('Error: $e'),
                  ),
                  const SizedBox(height: 32),
                  _buildMapPreview(context),
                  const SizedBox(height: 32),
                  _buildImpactCard(context),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Text(
        'Melaka Fix',
        style: AppTextStyles.headlineMedium.copyWith(color: AppColors.primary),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: AppColors.onBackground),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.secondaryContainer,
          child: Icon(Icons.person, size: 20, color: AppColors.onSecondaryContainer),
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildGreeting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selamat Pagi, Ahmad',
          style: AppTextStyles.headlineMedium,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: AppColors.secondary),
            const SizedBox(width: 4),
            Text(
              'Bukit Baru',
              style: AppTextStyles.labelLarge.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Your local neighbourhood is 85% clean today.',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('12', 'Open', AppColors.primaryContainer, AppColors.onPrimaryContainer),
        _buildStatCard('8', 'In Review', AppColors.secondaryContainer, AppColors.onSecondaryContainer),
        _buildStatCard('124', 'Resolved', AppColors.surfaceContainerHigh, AppColors.onSurface),
        _buildStatCard('3', 'High Priority', AppColors.errorContainer, AppColors.onErrorContainer),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppTextStyles.headlineMedium.copyWith(color: textColor),
          ),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(color: textColor.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitCTA(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Found a problem in Bukit Baru?',
            style: AppTextStyles.titleLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Submit a report now and help the council maintain our neighbourhood.',
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              shape: const StadiumBorder(),
            ),
            child: const Text('Submit Report'),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentReportsHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent Reports',
          style: AppTextStyles.titleLarge,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('See All'),
        ),
      ],
    );
  }

  Widget _buildRecentReportsList(BuildContext context, List<Complaint> complaints) {
    if (complaints.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text('No reports yet. Be the first!', style: AppTextStyles.bodyMedium),
        ),
      );
    }
    return Column(
      children: complaints.take(3).map((complaint) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildReportTile(
            complaint.title,
            'Reported ${timeago.format(complaint.createdAt)}',
            complaint.status.name.toUpperCase(),
            _getStatusColor(complaint.status),
          ),
        );
      }).toList(),
    );
  }

  Color _getStatusColor(ComplaintStatus status) {
    switch (status) {
      case ComplaintStatus.pending: return AppColors.info;
      case ComplaintStatus.inReview: return AppColors.warning;
      case ComplaintStatus.resolved: return AppColors.secondary;
      case ComplaintStatus.closed: return AppColors.outline;
    }
  }

  Widget _buildReportTile(String title, String subtitle, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.report_problem_outlined, color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.labelLarge),
                Text(subtitle, style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: AppTextStyles.labelSmall.copyWith(color: statusColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPreview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bukit Baru Map', style: AppTextStyles.titleLarge),
        const SizedBox(height: 16),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(24),
            image: const DecorationImage(
              image: NetworkImage('https://maps.googleapis.com/maps/api/staticmap?center=Bukit+Baru,Melaka&zoom=14&size=600x300&key=MOCK_KEY'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxType.circle,
              ),
              child: const Icon(Icons.location_on, color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImpactCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.secondaryContainer),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.emoji_events_outlined, color: AppColors.secondary),
              const SizedBox(width: 12),
              Text('Your Impact', style: AppTextStyles.titleLarge.copyWith(color: AppColors.secondary)),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Top 10 Contributor in Bukit Baru zone',
            style: AppTextStyles.labelLarge,
          ),
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 0.7,
            backgroundColor: AppColors.surfaceVariant,
            color: AppColors.secondary,
          ),
          const SizedBox(height: 12),
          Text(
            '5 more reports to achieve \'Civic Champion\' badge.',
            style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
