class LoginEntity {
  bool? isLogin;
  bool? isSignUp;
  String? accessToken;
  num? id;
  String? name;
  String? email;

  LoginEntity({
    this.isLogin,
    this.isSignUp,
    this.accessToken,
    this.id,
    this.name,
    this.email,
  });

  LoginEntity copyWith({
    bool? isLogin,
    bool? isSignUp,
    String? accessToken,
    num? id,
    String? name,
    String? email,
  }) {
    return LoginEntity(
      isLogin: isLogin ?? this.isLogin,
      isSignUp: isSignUp ?? this.isSignUp,
      accessToken: accessToken ?? this.accessToken,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is LoginEntity && runtimeType == other.runtimeType && isLogin == other.isLogin && isSignUp == other.isSignUp && accessToken == other.accessToken && id == other.id && name == other.name && email == other.email;
  }

  @override
  int get hashCode {
    return isLogin.hashCode ^ isSignUp.hashCode ^ accessToken.hashCode ^ id.hashCode ^ name.hashCode ^ email.hashCode;
  }
}
