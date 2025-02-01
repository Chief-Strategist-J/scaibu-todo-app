import 'package:todo_app/core/app_library.dart';

/// Doc Required
class FailResponse extends Failure {
  /// Doc Required
  FailResponse({
    this.message,
    this.status,
    this.data,
  });

  /// Doc Required
  factory FailResponse.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    return FailResponse(
      message: dataMap['message'] as String?,
      status: dataMap['status'] as bool?,
      data: dataMap['data'] != null ? FailData.fromJson(dataMap['data']) : null,
    );
  }

  /// Doc Required
  final String? message;

  /// Doc Required
  final bool? status;

  /// Doc Required
  final FailData? data;

  /// Doc Required
  FailResponse copyWith({
    final String? message,
    final bool? status,
    final FailData? data,
  }) =>
      FailResponse(
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

  @override
  List<Object?> get props => <Object?>[message, status, data];
}

/// Doc Required
class FailData {
  /// Doc Required
  const FailData({
    this.success,
    this.message,
  });

  /// Doc Required
  factory FailData.fromJson(final dynamic json) {
    final Map<String, dynamic> dataMap = json as Map<String, dynamic>;

    return FailData(
      success: dataMap['success'] as bool?,
      message: dataMap['message'] as String?,
    );
  }

  /// Doc Required
  final bool? success;

  /// Doc Required
  final String? message;

  /// Doc Required
  FailData copyWith({
    final bool? success,
    final String? message,
  }) =>
      FailData(
        success: success ?? this.success,
        message: message ?? this.message,
      );

  /// Doc Required
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }
}
