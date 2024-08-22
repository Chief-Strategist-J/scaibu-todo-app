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

  factory FailResponse.fromJson(dynamic json) {
    return FailResponse(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null ? FailData.fromJson(json['data']) : null,
    );
  }

  FailResponse copyWith({
    String? message,
    bool? status,
    FailData? data,
  }) {
    return FailResponse(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  @override
  List<Object?> get props => [message, status, data];
}

class FailData {
  final bool? success;
  final String? message;

  const FailData({
    this.success,
    this.message,
  });

  factory FailData.fromJson(dynamic json) {
    return FailData(
      success: json['success'],
      message: json['message'],
    );
  }

  FailData copyWith({
    bool? success,
    String? message,
  }) {
    return FailData(
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }
}
