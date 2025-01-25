/// Doc Required
class CreateOtpResponse {
  /// Doc Required
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
  /// Doc Required
  String? message;
  /// Doc Required
  bool? status;
  /// Doc Required
  Data? data;
  /// Doc Required
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

/// success : true
/// message : "OTP Is Sent Successfully."
/// otp : "142038"

class Data {
  /// Doc Required
  Data({
    this.success,
    this.message,
    this.otp,
  });

  /// Doc Required
  Data.fromJson(final dynamic json) {
    success = json['success'];
    message = json['message'];
    otp = json['otp'];
  }

  /// Doc Required
  bool? success;

  /// Doc Required
  String? message;

  /// Doc Required
  String? otp;

  /// Doc Required
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

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['otp'] = otp;
    return map;
  }
}
