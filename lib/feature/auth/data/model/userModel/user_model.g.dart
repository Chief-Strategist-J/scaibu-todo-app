// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as num?,
      firebaseUserDetailsId: json['firebaseUserDetailsId'] as String?,
      userId: json['userId'] as num?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      birthdate: json['birthdate'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zipcode: json['zipcode'] as String?,
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firebaseUserDetailsId': instance.firebaseUserDetailsId,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipcode': instance.zipcode,
      'avatar': instance.avatar,
      'bio': instance.bio,
    };
