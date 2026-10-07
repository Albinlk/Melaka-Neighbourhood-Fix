import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/complaint_service.dart';
import '../../../models/complaint.dart';

final complaintsStreamProvider = StreamProvider<List<Complaint>>((ref) {
  final service = ref.watch(complaintServiceProvider);
  return service.getComplaintsStream();
});

final userComplaintsStreamProvider = StreamProvider.family<List<Complaint>, String>((ref, userId) {
  final service = ref.watch(complaintServiceProvider);
  return service.getUserComplaintsStream(userId);
});

final filteredComplaintsProvider = Provider<AsyncValue<List<Complaint>>>((ref) {
  final complaints = ref.watch(complaintsStreamProvider);
  return complaints;
});
