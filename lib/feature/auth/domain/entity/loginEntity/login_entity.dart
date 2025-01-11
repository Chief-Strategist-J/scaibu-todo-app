import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';
part 'login_entity.g.dart';

/// A mixin that defines common properties related to login and sign-up entities
///
/// This mixin can be used to provide essential data for user authentication
/// and registration processes, such as login status, user information, and
/// access token.
mixin LoginEntityMixin {
  /// A boolean value indicating whether the user is logged in.
  ///
  /// Returns `true` if the user is logged in, `false` if not, or `null` if
  /// the status is unknown.
  bool? get isLogin;

  /// A boolean value indicating whether the user is signed up.
  ///
  /// Returns `true` if the user has signed up, `false` if not, or `null`
  /// if the sign-up status is unknown.
  bool? get isSignUp;

  /// The access token associated with the user's session.
  ///
  /// This token is typically used for authentication in API requests. It
  /// may be `null` if the user is not authenticated.
  String? get accessToken;

  /// The unique identifier of the user.
  ///
  /// This ID is usually assigned during user registration or login. It may
  /// be `null` if the ID is not available.
  num? get id;

  /// The name of the user.
  ///
  /// This field holds the user's name and may be `null` if not available.
  String? get name;

  /// The email address associated with the user.
  ///
  /// This field holds the user's email address and may be `null` if not
  /// provided.
  String? get email;
}

/// Login Entity
@freezed
class LoginEntity with _$LoginEntity {
  // Add this line
  /// Login Entity constructor
  const factory LoginEntity({
    final bool? isLogin,
    final bool? isSignUp,
    final String? accessToken,
    final num? id,
    final String? name,
    final String? email,
  }) = _LoginEntity;

  const LoginEntity._();

  /// login entity from json constructor
  factory LoginEntity.fromJson(final Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);
}
