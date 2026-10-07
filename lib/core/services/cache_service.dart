import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/complaint.dart';

final cacheServiceProvider = Provider<CacheService>((ref) {
  return CacheService();
});

class CacheService {
  static const String complaintsBoxName = 'complaints_cache';
  static const String pendingSubmissionsBoxName = 'pending_submissions';

  Future<void> init() async {
    await Hive.initFlutter();
    // Register adapters if needed
    // Note: Freezed/JSON models can be stored as Maps or with TypeAdapters
    await Hive.openBox(complaintsBoxName);
    await Hive.openBox(pendingSubmissionsBoxName);
  }

  Future<void> cacheComplaints(List<Complaint> complaints) async {
    final box = Hive.box(complaintsBoxName);
    final data = {for (var c in complaints) c.id: c.toJson()};
    await box.putAll(data);
  }

  List<Complaint> getCachedComplaints() {
    final box = Hive.box(complaintsBoxName);
    return box.values
        .map((e) => Complaint.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> addPendingSubmission(Complaint complaint) async {
    final box = Hive.box(pendingSubmissionsBoxName);
    await box.put(complaint.id, complaint.toJson());
  }

  List<Complaint> getPendingSubmissions() {
    final box = Hive.box(pendingSubmissionsBoxName);
    return box.values
        .map((e) => Complaint.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> removePendingSubmission(String id) async {
    final box = Hive.box(pendingSubmissionsBoxName);
    await box.delete(id);
  }
}
