// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => _LoginEntity(
      isLogin: json['isLogin'] as bool?,
      isSignUp: json['isSignUp'] as bool?,
      accessToken: json['accessToken'] as String?,
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$LoginEntityToJson(_LoginEntity instance) =>
    <String, dynamic>{
      'isLogin': instance.isLogin,
      'isSignUp': instance.isSignUp,
      'accessToken': instance.accessToken,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
