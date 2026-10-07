import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

enum UserRole {
  resident,
  admin
}

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? neighbourhood,
    @Default(UserRole.resident) UserRole role,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}
