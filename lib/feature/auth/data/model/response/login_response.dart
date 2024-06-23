class LoginResponse {
  LoginResponse({
    this.message,
    this.status,
    this.data,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  String? message;
  bool? status;
  LoginData? data;

  LoginResponse copyWith({
    String? message,
    bool? status,
    LoginData? data,
  }) =>
      LoginResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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

  LoginData.fromJson(dynamic json) {
    isLogin = json['is_login'];
    isSignUp = json['is_sign_up'];
    accessToken = json['access_token'];
    userInfo = json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }

  bool? isLogin;
  bool? isSignUp;
  String? accessToken;
  UserInfo? userInfo;

  LoginData copyWith({
    bool? isLogin,
    bool? isSignUp,
    String? accessToken,
    UserInfo? userInfo,
  }) =>
      LoginData(
        isLogin: isLogin ?? this.isLogin,
        isSignUp: isSignUp ?? this.isSignUp,
        accessToken: accessToken ?? this.accessToken,
        userInfo: userInfo ?? this.userInfo,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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

  UserInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  num? id;
  String? name;
  String? email;

  UserInfo copyWith({
    num? id,
    String? name,
    String? email,
  }) =>
      UserInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
