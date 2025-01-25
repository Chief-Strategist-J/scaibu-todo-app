class LoginResponse {
  LoginResponse({
    this.message,
    this.status,
    this.data,
  });

  LoginResponse.fromJson(final dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  String? message;
  bool? status;
  LoginData? data;

  LoginResponse copyWith({
    final String? message,
    final bool? status,
    final LoginData? data,
  }) =>
      LoginResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class LoginData {
  LoginData({
    this.isLogin,
    this.isSignUp,
    this.accessToken,
    this.userInfo,
  });

  LoginData.fromJson(final dynamic json) {
    isLogin = json['is_login'];
    isSignUp = json['is_sign_up'];
    accessToken = json['access_token'];
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }

  bool? isLogin;
  bool? isSignUp;
  String? accessToken;
  UserInfo? userInfo;

  LoginData copyWith({
    final bool? isLogin,
    final bool? isSignUp,
    final String? accessToken,
    final UserInfo? userInfo,
  }) =>
      LoginData(
        isLogin: isLogin ?? this.isLogin,
        isSignUp: isSignUp ?? this.isSignUp,
        accessToken: accessToken ?? this.accessToken,
        userInfo: userInfo ?? this.userInfo,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['is_login'] = isLogin;
    map['is_sign_up'] = isSignUp;
    map['access_token'] = accessToken;
    if (userInfo != null) {
      map['user_info'] = userInfo?.toJson();
    }
    return map;
  }
}

class UserInfo {
  UserInfo({
    this.id,
    this.name,
    this.email,
  });

  UserInfo.fromJson(final dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  num? id;
  String? name;
  String? email;

  UserInfo copyWith({
    final num? id,
    final String? name,
    final String? email,
  }) =>
      UserInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
