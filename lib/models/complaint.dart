import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint.freezed.dart';
part 'complaint.g.dart';

enum ComplaintStatus {
  submitted,
  under_review,
  assigned,
  in_progress,
  resolved,
  rejected,
  duplicate
}

@freezed
class Complaint with _$Complaint {
  const factory Complaint({
    required String id,
    required String userId,
    required String title,
    required String description,
    required String category,
    @Default([]) List<String> imageUrls,
    required double lat,
    required double lng,
    required String neighbourhood,
    int? aiScore,
    String? aiPriority,
    String? aiReason,
    String? aiDepartment,
    @Default(ComplaintStatus.submitted) ComplaintStatus status,
    @Default(0) int upvotes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Complaint;

  factory Complaint.fromJson(Map<String, dynamic> json) => _$ComplaintFromJson(json);
}
