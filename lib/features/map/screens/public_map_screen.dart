import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../complaints/providers/complaint_providers.dart';
import '../../../models/complaint.dart';

class PublicMapScreen extends ConsumerStatefulWidget {
  const PublicMapScreen({super.key});

  @override
  ConsumerState<PublicMapScreen> createState() => _PublicMapScreenState();
}

class _PublicMapScreenState extends ConsumerState<PublicMapScreen> {
  final MapController _mapController = MapController();
  final LatLng _melakaCenter = const LatLng(2.2264, 102.2741);

  @override
  Widget build(BuildContext context) {
    final complaintsAsync = ref.watch(complaintsStreamProvider);

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _melakaCenter,
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.melaka.neighbourhoodfix',
              ),
              complaintsAsync.when(
                data: (complaints) => MarkerLayer(
                  markers: complaints.map((c) => _buildMarker(LatLng(c.latitude, c.longitude), _getStatusColor(c.status), c)).toList(),
                ),
                loading: () => const MarkerLayer(markers: []),
                error: (_, __) => const MarkerLayer(markers: []),
              ),
            ],
          ),
          
          // ... (Header and other overlays remain similar)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: AppColors.outline),
                        const SizedBox(width: 12),
                        const Expanded(child: Text('Search neighbourhood...')),
                        const VerticalDivider(indent: 12, endIndent: 12),
                        const Icon(Icons.tune, color: AppColors.primary),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Marker _buildMarker(LatLng point, Color color, Complaint complaint) {
    return Marker(
      point: point,
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () => _showComplaintPreview(context, complaint),
        child: Container(
          decoration: BoxDecoration(color: color.withOpacity(0.2), shape: BoxType.circle),
          child: Center(child: Icon(Icons.location_on, color: color, size: 24)),
        ),
      ),
    );
  }

  void _showComplaintPreview(BuildContext context, Complaint complaint) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 200,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.image_outlined, color: AppColors.outline),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(complaint.title, style: AppTextStyles.titleLarge),
                  Text(complaint.category, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                  const Spacer(),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                    child: const Text('View Details'),
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
