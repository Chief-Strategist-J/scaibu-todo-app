/// Doc Required
class VerifyOtpForForgetPasswordResponse {
  /// Doc Required
  VerifyOtpForForgetPasswordResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required
  VerifyOtpForForgetPasswordResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    message = dataMap['message'] as String?;
    status = dataMap['status'] as bool?;
    data = dataMap['data'] != null ? UserData.fromJson(dataMap['data']) : null;
  }


  /// Doc Required
  String? message;

  /// Doc Required
  bool? status;

  /// Doc Required
  UserData? data;

  /// Doc Required
  VerifyOtpForForgetPasswordResponse copyWith({
    final String? message,
    final bool? status,
    final UserData? data,
  }) =>
      VerifyOtpForForgetPasswordResponse(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  /// Doc Required
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

/// Doc Required
class Data {
  /// Doc Required
  Data({
    this.success,
    this.message,
    this.accessToken,
    this.data,
  });

  /// Doc Required
  Data.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    success = dataMap['success'] as bool?;
    message = dataMap['message'] as String?;
    accessToken = dataMap['access_token'] as String?;
    data = dataMap['data'] != null ? Data.fromJson(dataMap['data']) : null;
  }


  /// Doc Required
  bool? success;

  /// Doc Required
  String? message;

  /// Doc Required
  String? accessToken;

  /// Doc Required
  Data? data;

  /// Doc Required
  Data copyWith({
    final bool? success,
    final String? message,
    final String? accessToken,
    final Data? data,
  }) =>
      Data(
        success: success ?? this.success,
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        data: data ?? this.data,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['access_token'] = accessToken;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// Doc Required
class UserData {
  /// Doc Required
  UserData({
    this.id,
    this.firebaseUserDetailsId,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.birthdate,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.avatar,
    this.bio,
  });

  /// Doc Required
  UserData.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    id = dataMap['id'] as num?;
    firebaseUserDetailsId = dataMap['firebase_user_details_id'] as String?;
    userId = dataMap['user_id'] as num?;
    firstName = dataMap['first_name'] as String?;
    lastName = dataMap['last_name'] as String?;
    email = dataMap['email'] as String?;
    phone = dataMap['phone'] as String?;
    birthdate = dataMap['birthdate'] as String?;
    address = dataMap['address'] as String?;
    city = dataMap['city'] as String?;
    state = dataMap['state'] as String?;
    country = dataMap['country'] as String?;
    zipcode = dataMap['zipcode'] as String?;
    avatar = dataMap['avatar'] as String?;
    bio = dataMap['bio'] as String?;
  }


  /// Doc Required
  num? id;

  /// Doc Required
  String? firebaseUserDetailsId;

  /// Doc Required
  num? userId;

  /// Doc Required
  String? firstName;

  /// Doc Required
  String? lastName;

  /// Doc Required
  String? email;

  /// Doc Required
  String? phone;

  /// Doc Required
  String? birthdate;

  /// Doc Required
  String? address;

  /// Doc Required
  String? city;

  /// Doc Required
  String? state;

  /// Doc Required
  String? country;

  /// Doc Required
  String? zipcode;

  /// Doc Required
  String? avatar;

  /// Doc Required
  String? bio;

  /// Doc Required
  UserData copyWith({
    final num? id,
    final String? firebaseUserDetailsId,
    final num? userId,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? phone,
    final String? birthdate,
    final String? address,
    final String? city,
    final String? state,
    final String? country,
    final String? zipcode,
    final String? avatar,
    final String? bio,
  }) =>
      UserData(
        id: id ?? this.id,
        firebaseUserDetailsId:
            firebaseUserDetailsId ?? this.firebaseUserDetailsId,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        birthdate: birthdate ?? this.birthdate,
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        zipcode: zipcode ?? this.zipcode,
        avatar: avatar ?? this.avatar,
        bio: bio ?? this.bio,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['firebase_user_details_id'] = firebaseUserDetailsId;
    map['user_id'] = userId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['birthdate'] = birthdate;
    map['address'] = address;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['zipcode'] = zipcode;
    map['avatar'] = avatar;
    map['bio'] = bio;
    return map;
  }
}
