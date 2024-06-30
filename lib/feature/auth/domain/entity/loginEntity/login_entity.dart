import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';
part 'login_entity.g.dart';

mixin LoginEntityMixin {
  bool? get isLogin;

  bool? get isSignUp;

  String? get accessToken;

  num? get id;

  String? get name;

  String? get email;
}

@freezed
class LoginEntity with _$LoginEntity {
  const LoginEntity._(); // Add this line

  const factory LoginEntity({
    bool? isLogin,
    bool? isSignUp,
    String? accessToken,
    num? id,
    String? name,
    String? email,
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);
}
