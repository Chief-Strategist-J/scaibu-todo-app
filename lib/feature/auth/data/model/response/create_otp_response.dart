class CreateOtpResponse {
  CreateOtpResponse({
    this.message,
    this.status,
    this.data,
  });

  CreateOtpResponse.fromJson(final dynamic json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? message;
  bool? status;
  Data? data;

  CreateOtpResponse copyWith({
    final String? message,
    final bool? status,
    final Data? data,
  }) =>
      CreateOtpResponse(
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

/// success : true
/// message : "OTP Is Sent Successfully."
/// otp : "142038"

class Data {
  Data({
    this.success,
    this.message,
    this.otp,
  });

  Data.fromJson(final dynamic json) {
    success = json['success'];
    message = json['message'];
    otp = json['otp'];
  }

  bool? success;
  String? message;
  String? otp;

  Data copyWith({
    final bool? success,
    final String? message,
    final String? otp,
  }) =>
      Data(
        success: success ?? this.success,
        message: message ?? this.message,
        otp: otp ?? this.otp,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['otp'] = otp;
    return map;
  }
}
