import 'package:todo_app/core/app_library.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

/// Doc Required
@freezed
abstract class LoginModel with _$LoginModel, LoginEntityMixin {
  // Add this line
  /// Doc Required
  const factory LoginModel({
    @override final bool? isLogin,
    @override final bool? isSignUp,
    @override final String? accessToken,
    @override final num? id,
    @override final String? name,
    @override final String? email,
  }) = _LoginModel;
  const LoginModel._();

  /// Doc Required
  factory LoginModel.fromJson(final Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
