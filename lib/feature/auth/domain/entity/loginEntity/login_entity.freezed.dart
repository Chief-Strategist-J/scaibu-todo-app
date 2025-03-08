// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginEntity {
  bool? get isLogin;
  bool? get isSignUp;
  String? get accessToken;
  num? get id;
  String? get name;
  String? get email;

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginEntityCopyWith<LoginEntity> get copyWith =>
      _$LoginEntityCopyWithImpl<LoginEntity>(this as LoginEntity, _$identity);

  /// Serializes this LoginEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginEntity &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.isSignUp, isSignUp) ||
                other.isSignUp == isSignUp) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLogin, isSignUp, accessToken, id, name, email);

  @override
  String toString() {
    return 'LoginEntity(isLogin: $isLogin, isSignUp: $isSignUp, accessToken: $accessToken, id: $id, name: $name, email: $email)';
  }
}

/// @nodoc
abstract mixin class $LoginEntityCopyWith<$Res> {
  factory $LoginEntityCopyWith(
          LoginEntity value, $Res Function(LoginEntity) _then) =
      _$LoginEntityCopyWithImpl;
  @useResult
  $Res call(
      {bool? isLogin,
      bool? isSignUp,
      String? accessToken,
      num? id,
      String? name,
      String? email});
}

/// @nodoc
class _$LoginEntityCopyWithImpl<$Res> implements $LoginEntityCopyWith<$Res> {
  _$LoginEntityCopyWithImpl(this._self, this._then);

  final LoginEntity _self;
  final $Res Function(LoginEntity) _then;

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = freezed,
    Object? isSignUp = freezed,
    Object? accessToken = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_self.copyWith(
      isLogin: freezed == isLogin
          ? _self.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSignUp: freezed == isSignUp
          ? _self.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LoginEntity extends LoginEntity {
  const _LoginEntity(
      {this.isLogin,
      this.isSignUp,
      this.accessToken,
      this.id,
      this.name,
      this.email})
      : super._();
  factory _LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

  @override
  final bool? isLogin;
  @override
  final bool? isSignUp;
  @override
  final String? accessToken;
  @override
  final num? id;
  @override
  final String? name;
  @override
  final String? email;

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginEntityCopyWith<_LoginEntity> get copyWith =>
      __$LoginEntityCopyWithImpl<_LoginEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginEntity &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.isSignUp, isSignUp) ||
                other.isSignUp == isSignUp) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isLogin, isSignUp, accessToken, id, name, email);

  @override
  String toString() {
    return 'LoginEntity(isLogin: $isLogin, isSignUp: $isSignUp, accessToken: $accessToken, id: $id, name: $name, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$LoginEntityCopyWith<$Res>
    implements $LoginEntityCopyWith<$Res> {
  factory _$LoginEntityCopyWith(
          _LoginEntity value, $Res Function(_LoginEntity) _then) =
      __$LoginEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool? isLogin,
      bool? isSignUp,
      String? accessToken,
      num? id,
      String? name,
      String? email});
}

/// @nodoc
class __$LoginEntityCopyWithImpl<$Res> implements _$LoginEntityCopyWith<$Res> {
  __$LoginEntityCopyWithImpl(this._self, this._then);

  final _LoginEntity _self;
  final $Res Function(_LoginEntity) _then;

  /// Create a copy of LoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLogin = freezed,
    Object? isSignUp = freezed,
    Object? accessToken = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_LoginEntity(
      isLogin: freezed == isLogin
          ? _self.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSignUp: freezed == isSignUp
          ? _self.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
