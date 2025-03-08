// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => _LoginModel(
      isLogin: json['isLogin'] as bool?,
      isSignUp: json['isSignUp'] as bool?,
      accessToken: json['accessToken'] as String?,
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(_LoginModel instance) =>
    <String, dynamic>{
      'isLogin': instance.isLogin,
      'isSignUp': instance.isSignUp,
      'accessToken': instance.accessToken,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
