// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplaintImpl _$$ComplaintImplFromJson(Map<String, dynamic> json) =>
    _$ComplaintImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      neighbourhood: json['neighbourhood'] as String,
      aiScore: (json['aiScore'] as num?)?.toInt(),
      aiPriority: json['aiPriority'] as String?,
      aiReason: json['aiReason'] as String?,
      aiDepartment: json['aiDepartment'] as String?,
      status: $enumDecodeNullable(_$ComplaintStatusEnumMap, json['status']) ??
          ComplaintStatus.submitted,
      upvotes: (json['upvotes'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ComplaintImplToJson(_$ComplaintImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'imageUrls': instance.imageUrls,
      'lat': instance.lat,
      'lng': instance.lng,
      'neighbourhood': instance.neighbourhood,
      'aiScore': instance.aiScore,
      'aiPriority': instance.aiPriority,
      'aiReason': instance.aiReason,
      'aiDepartment': instance.aiDepartment,
      'status': _$ComplaintStatusEnumMap[instance.status]!,
      'upvotes': instance.upvotes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ComplaintStatusEnumMap = {
  ComplaintStatus.submitted: 'submitted',
  ComplaintStatus.under_review: 'under_review',
  ComplaintStatus.assigned: 'assigned',
  ComplaintStatus.in_progress: 'in_progress',
  ComplaintStatus.resolved: 'resolved',
  ComplaintStatus.rejected: 'rejected',
  ComplaintStatus.duplicate: 'duplicate',
};
