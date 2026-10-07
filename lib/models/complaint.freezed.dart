// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Complaint _$ComplaintFromJson(Map<String, dynamic> json) {
  return _Complaint.fromJson(json);
}

/// @nodoc
mixin _$Complaint {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get neighbourhood => throw _privateConstructorUsedError;
  int? get aiScore => throw _privateConstructorUsedError;
  String? get aiPriority => throw _privateConstructorUsedError;
  String? get aiReason => throw _privateConstructorUsedError;
  String? get aiDepartment => throw _privateConstructorUsedError;
  ComplaintStatus get status => throw _privateConstructorUsedError;
  int get upvotes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplaintCopyWith<Complaint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintCopyWith<$Res> {
  factory $ComplaintCopyWith(Complaint value, $Res Function(Complaint) then) =
      _$ComplaintCopyWithImpl<$Res, Complaint>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      String category,
      List<String> imageUrls,
      double lat,
      double lng,
      String neighbourhood,
      int? aiScore,
      String? aiPriority,
      String? aiReason,
      String? aiDepartment,
      ComplaintStatus status,
      int upvotes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ComplaintCopyWithImpl<$Res, $Val extends Complaint>
    implements $ComplaintCopyWith<$Res> {
  _$ComplaintCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? imageUrls = null,
    Object? lat = null,
    Object? lng = null,
    Object? neighbourhood = null,
    Object? aiScore = freezed,
    Object? aiPriority = freezed,
    Object? aiReason = freezed,
    Object? aiDepartment = freezed,
    Object? status = null,
    Object? upvotes = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      neighbourhood: null == neighbourhood
          ? _value.neighbourhood
          : neighbourhood // ignore: cast_nullable_to_non_nullable
              as String,
      aiScore: freezed == aiScore
          ? _value.aiScore
          : aiScore // ignore: cast_nullable_to_non_nullable
              as int?,
      aiPriority: freezed == aiPriority
          ? _value.aiPriority
          : aiPriority // ignore: cast_nullable_to_non_nullable
              as String?,
      aiReason: freezed == aiReason
          ? _value.aiReason
          : aiReason // ignore: cast_nullable_to_non_nullable
              as String?,
      aiDepartment: freezed == aiDepartment
          ? _value.aiDepartment
          : aiDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ComplaintStatus,
      upvotes: null == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplaintImplCopyWith<$Res>
    implements $ComplaintCopyWith<$Res> {
  factory _$$ComplaintImplCopyWith(
          _$ComplaintImpl value, $Res Function(_$ComplaintImpl) then) =
      __$$ComplaintImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String description,
      String category,
      List<String> imageUrls,
      double lat,
      double lng,
      String neighbourhood,
      int? aiScore,
      String? aiPriority,
      String? aiReason,
      String? aiDepartment,
      ComplaintStatus status,
      int upvotes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ComplaintImplCopyWithImpl<$Res>
    extends _$ComplaintCopyWithImpl<$Res, _$ComplaintImpl>
    implements _$$ComplaintImplCopyWith<$Res> {
  __$$ComplaintImplCopyWithImpl(
      _$ComplaintImpl _value, $Res Function(_$ComplaintImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? imageUrls = null,
    Object? lat = null,
    Object? lng = null,
    Object? neighbourhood = null,
    Object? aiScore = freezed,
    Object? aiPriority = freezed,
    Object? aiReason = freezed,
    Object? aiDepartment = freezed,
    Object? status = null,
    Object? upvotes = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ComplaintImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      neighbourhood: null == neighbourhood
          ? _value.neighbourhood
          : neighbourhood // ignore: cast_nullable_to_non_nullable
              as String,
      aiScore: freezed == aiScore
          ? _value.aiScore
          : aiScore // ignore: cast_nullable_to_non_nullable
              as int?,
      aiPriority: freezed == aiPriority
          ? _value.aiPriority
          : aiPriority // ignore: cast_nullable_to_non_nullable
              as String?,
      aiReason: freezed == aiReason
          ? _value.aiReason
          : aiReason // ignore: cast_nullable_to_non_nullable
              as String?,
      aiDepartment: freezed == aiDepartment
          ? _value.aiDepartment
          : aiDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ComplaintStatus,
      upvotes: null == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplaintImpl implements _Complaint {
  const _$ComplaintImpl(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      required this.category,
      final List<String> imageUrls = const [],
      required this.lat,
      required this.lng,
      required this.neighbourhood,
      this.aiScore,
      this.aiPriority,
      this.aiReason,
      this.aiDepartment,
      this.status = ComplaintStatus.submitted,
      this.upvotes = 0,
      required this.createdAt,
      required this.updatedAt})
      : _imageUrls = imageUrls;

  factory _$ComplaintImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplaintImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String neighbourhood;
  @override
  final int? aiScore;
  @override
  final String? aiPriority;
  @override
  final String? aiReason;
  @override
  final String? aiDepartment;
  @override
  @JsonKey()
  final ComplaintStatus status;
  @override
  @JsonKey()
  final int upvotes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Complaint(id: $id, userId: $userId, title: $title, description: $description, category: $category, imageUrls: $imageUrls, lat: $lat, lng: $lng, neighbourhood: $neighbourhood, aiScore: $aiScore, aiPriority: $aiPriority, aiReason: $aiReason, aiDepartment: $aiDepartment, status: $status, upvotes: $upvotes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.neighbourhood, neighbourhood) ||
                other.neighbourhood == neighbourhood) &&
            (identical(other.aiScore, aiScore) || other.aiScore == aiScore) &&
            (identical(other.aiPriority, aiPriority) ||
                other.aiPriority == aiPriority) &&
            (identical(other.aiReason, aiReason) ||
                other.aiReason == aiReason) &&
            (identical(other.aiDepartment, aiDepartment) ||
                other.aiDepartment == aiDepartment) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.upvotes, upvotes) || other.upvotes == upvotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      description,
      category,
      const DeepCollectionEquality().hash(_imageUrls),
      lat,
      lng,
      neighbourhood,
      aiScore,
      aiPriority,
      aiReason,
      aiDepartment,
      status,
      upvotes,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintImplCopyWith<_$ComplaintImpl> get copyWith =>
      __$$ComplaintImplCopyWithImpl<_$ComplaintImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplaintImplToJson(
      this,
    );
  }
}

abstract class _Complaint implements Complaint {
  const factory _Complaint(
      {required final String id,
      required final String userId,
      required final String title,
      required final String description,
      required final String category,
      final List<String> imageUrls,
      required final double lat,
      required final double lng,
      required final String neighbourhood,
      final int? aiScore,
      final String? aiPriority,
      final String? aiReason,
      final String? aiDepartment,
      final ComplaintStatus status,
      final int upvotes,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ComplaintImpl;

  factory _Complaint.fromJson(Map<String, dynamic> json) =
      _$ComplaintImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  List<String> get imageUrls;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get neighbourhood;
  @override
  int? get aiScore;
  @override
  String? get aiPriority;
  @override
  String? get aiReason;
  @override
  String? get aiDepartment;
  @override
  ComplaintStatus get status;
  @override
  int get upvotes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ComplaintImplCopyWith<_$ComplaintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
