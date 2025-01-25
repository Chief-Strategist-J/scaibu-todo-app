import 'package:todo_app/core/app_library.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel, LoginEntityMixin {
  // Add this line

  const factory LoginModel({
    @override final bool? isLogin,
    @override final bool? isSignUp,
    @override final String? accessToken,
    @override final num? id,
    @override final String? name,
    @override final String? email,
  }) = _LoginModel;
  const LoginModel._();

  factory LoginModel.fromJson(final Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
