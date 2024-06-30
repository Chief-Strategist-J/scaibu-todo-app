// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginEntityImpl _$$LoginEntityImplFromJson(Map<String, dynamic> json) =>
    _$LoginEntityImpl(
      isLogin: json['isLogin'] as bool?,
      isSignUp: json['isSignUp'] as bool?,
      accessToken: json['accessToken'] as String?,
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$LoginEntityImplToJson(_$LoginEntityImpl instance) =>
    <String, dynamic>{
      'isLogin': instance.isLogin,
      'isSignUp': instance.isSignUp,
      'accessToken': instance.accessToken,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
