import 'package:todo_app/core/app_library.dart';

class FailResponse extends Failure {
  final String? message;
  final bool? status;
  final FailData? data;

  FailResponse({
    this.message,
    this.status,
    this.data,
  });

  factory FailResponse.fromJson(final dynamic json) => FailResponse(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null ? FailData.fromJson(json['data']) : null,
    );

  FailResponse copyWith({
    final String? message,
    final bool? status,
    final FailData? data,
  }) => FailResponse(
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

  @override
  List<Object?> get props => <Object?>[message, status, data];
}

class FailData {
  final bool? success;
  final String? message;

  const FailData({
    this.success,
    this.message,
  });

  factory FailData.fromJson(final dynamic json) => FailData(
      success: json['success'],
      message: json['message'],
    );

  FailData copyWith({
    final bool? success,
    final String? message,
  }) => FailData(
      success: success ?? this.success,
      message: message ?? this.message,
    );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }
}
