
import 'package:todo_app/core/app_library.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    super.accessToken,
    super.email,
    super.id,
    super.isLogin,
    super.isSignUp,
    super.name,
  });

  factory LoginModel.fromJson(dynamic json) {
    return LoginModel(
      id: json['id'],
      accessToken: json['access_token'],
      isSignUp: json['is_sign_up'],
      isLogin: json['is_login'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'is_login': isLogin,
      'is_sign_up': isSignUp,
      'access_token': accessToken,
    };
  }
}
