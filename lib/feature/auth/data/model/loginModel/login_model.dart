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

// Yes, if a method's return type is LoginEntity and you're returning a LoginModel, it will work.
// This is due to the way we've set up the classes using the mixin approach.
//
// LoginEntity getLoginInfo() => LoginModel();
// This is valid because LoginModel has all the properties of LoginEntity
