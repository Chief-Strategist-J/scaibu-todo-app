class VerifyOtpForForgetPasswordResponse {
  VerifyOtpForForgetPasswordResponse({
    this.message,
    this.status,
    this.data,
  });

  VerifyOtpForForgetPasswordResponse.fromJson(final dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
  String? message;
  bool? status;
  UserData? data;
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

class Data {
  Data({
    this.success,
    this.message,
    this.accessToken,
    this.data,
  });

  Data.fromJson(final dynamic json) {
    success = json['success'];
    message = json['message'];
    accessToken = json['access_token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  String? accessToken;
  Data? data;

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



class UserData {
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

  UserData.fromJson(final dynamic json) {

    id = json['id'];
    firebaseUserDetailsId = json['firebase_user_details_id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipcode = json['zipcode'];
    avatar = json['avatar'];
    bio = json['bio'];
  }

  num? id;
  String? firebaseUserDetailsId;
  num? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? birthdate;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? avatar;
  String? bio;

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
        firebaseUserDetailsId: firebaseUserDetailsId ?? this.firebaseUserDetailsId,
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
