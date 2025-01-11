import 'package:todo_app/core/app_library.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

mixin UserEntityMixin {
  num? get id;

  String? get firebaseUserDetailsId;

  num? get userId;

  String? get firstName;

  String? get lastName;

  String? get email;

  String? get phone;

  String? get birthdate;

  String? get address;

  String? get city;

  String? get state;

  String? get country;

  String? get zipcode;

  String? get avatar;

  String? get bio;
}

@freezed
class UserEntity with _$UserEntity {
  // Add this line

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

  factory UserEntity.fromJson(final Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
