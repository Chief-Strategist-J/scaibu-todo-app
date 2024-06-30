import 'package:todo_app/core/app_library.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel, LoginEntityMixin {
  const LoginModel._(); // Add this line

  const factory LoginModel({
    @override bool? isLogin,
    @override bool? isSignUp,
    @override String? accessToken,
    @override num? id,
    @override String? name,
    @override String? email,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}

// Yes, if a method's return type is LoginEntity and you're returning a LoginModel, it will work.
// This is due to the way we've set up the classes using the mixin approach.
//
// LoginEntity getLoginInfo() => LoginModel();
// This is valid because LoginModel has all the properties of LoginEntity

