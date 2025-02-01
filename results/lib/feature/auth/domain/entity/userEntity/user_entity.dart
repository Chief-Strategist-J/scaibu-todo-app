import 'package:todo_app/core/app_library.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// Doc Required
mixin UserEntityMixin {
  /// Doc Required
  num? get id;

  /// Doc Required
  String? get firebaseUserDetailsId;

  /// Doc Required
  num? get userId;

  /// Doc Required
  String? get firstName;

  /// Doc Required
  String? get lastName;

  /// Doc Required
  String? get email;

  /// Doc Required
  String? get phone;

  /// Doc Required
  String? get birthdate;

  /// Doc Required
  String? get address;

  /// Doc Required
  String? get city;

  /// Doc Required
  String? get state;

  /// Doc Required
  String? get country;

  /// Doc Required
  String? get zipcode;

  /// Doc Required
  String? get avatar;

  /// Doc Required
  String? get bio;
}

/// Doc Required
@freezed
class UserEntity with _$UserEntity {
  // Add this line
  /// Doc Required
  const factory UserEntity({
    final num? id,
    final String? firebaseUserDetailsId,
    final num? userId,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? phone,
    final String? birthdate,
    final String? address,
    final String? city,
    final String? state,
    final String? country,
    final String? zipcode,
    final String? avatar,
    final String? bio,
  }) = _UserEntity;
  const UserEntity._();

  /// Doc Required
  factory UserEntity.fromJson(final Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
