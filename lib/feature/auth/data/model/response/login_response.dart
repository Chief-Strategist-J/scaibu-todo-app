///Doc Required
class LoginResponse {
  ///Doc Required
  LoginResponse({
    this.message,
    this.status,
    this.data,
  });

  ///Doc Required
  LoginResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    message = dataMap['message'] as String?;
    status = dataMap['status'] as bool?;
    data = dataMap['data'] != null ? LoginData.fromJson(dataMap['data']) : null;
  }

  ///Doc Required
  String? message;

  ///Doc Required
  bool? status;

  ///Doc Required
  LoginData? data;

  ///Doc Required
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

  ///Doc Required
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

///Doc Required
class LoginData {
  ///Doc Required
  LoginData({
    this.isLogin,
    this.isSignUp,
    this.accessToken,
    this.userInfo,
  });

  ///Doc Required
  LoginData.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    isLogin = dataMap['is_login'] as bool?;
    isSignUp = dataMap['is_sign_up'] as bool?;
    accessToken = dataMap['access_token'] as String?;
    userInfo = dataMap['user_info'] != null
        ? UserInfo.fromJson(dataMap['user_info'])
        : null;
  }

  ///Doc Required
  bool? isLogin;

  ///Doc Required
  bool? isSignUp;

  ///Doc Required
  String? accessToken;

  ///Doc Required
  UserInfo? userInfo;

  ///Doc Required
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

  ///Doc Required
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

///Doc Required
class UserInfo {
  ///Doc Required
  UserInfo({
    this.id,
    this.name,
    this.email,
  });

  ///Doc Required

  UserInfo.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    id = dataMap['id'] as num?;
    name = dataMap['name'] as String?;
    email = dataMap['email'] as String?;
  }

  ///Doc Required
  num? id;

  ///Doc Required
  String? name;

  ///Doc Required
  String? email;

  ///Doc Required
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

  ///Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
