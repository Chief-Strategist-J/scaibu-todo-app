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
  const UserEntity._(); // Add this line

  const factory UserEntity({
    num? id,
    String? firebaseUserDetailsId,
    num? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? birthdate,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    String? avatar,
    String? bio,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
