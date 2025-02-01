/// Doc Required
class CreateOtpResponse {
  /// Doc Required
  CreateOtpResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required
  CreateOtpResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    message = dataMap['message'] as String?;
    status = dataMap['status'] as bool?;
    data = dataMap['data'] != null
        ? Data.fromJson(dataMap['data'] as Map<String, dynamic>)
        : null;
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
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    success = dataMap['success'] as bool?;
    message = dataMap['message'] as String?;
    otp = dataMap['otp'] as String?;
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
