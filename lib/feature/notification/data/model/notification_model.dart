import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

mixin NotificationEntityMixin {
  int get id;

  int get userId;

  String get title;

  String? get message;

  String get type;

  String get status;

  bool get isSeen;

  bool get isArchived;

  String get priority;

  DateTime? get sentAt;

  DateTime? get readAt;

  DateTime? get archivedAt;

  DateTime? get deletedAt;

  String? get url;

  String? get icon;

  Map<String, dynamic>? get metadata;

  String? get metadataAction;

  String? get metadataTarget;

  int get flags;

  String get platform;

  int get clickCount;

  int get retryCount;

  double? get deliveryTime;

  int? get responseCode;

  String get uuid;

  int get createdAt;

  int get updatedAt;
}


@freezed
class NotificationModel with _$NotificationModel, NotificationEntityMixin {
  const factory NotificationModel({
    required int id,
    required int userId,
    @Default('New Notification') String title,
    String? message,
    @Default('general') String type,
    @Default('unread') String status,
    @Default(false) bool isSeen,
    @Default(false) bool isArchived,
    @Default('medium') String priority,
    DateTime? sentAt,
    DateTime? readAt,
    DateTime? archivedAt,
    DateTime? deletedAt,
    String? url,
    String? icon,
    Map<String, dynamic>? metadata,
    String? metadataAction,
    String? metadataTarget,
    @Default(0) int flags,
    @Default('web') String platform,
    @Default(0) int clickCount,
    @Default(0) int retryCount,
    double? deliveryTime,
    int? responseCode,
    required String uuid,
    required int createdAt,
    required int updatedAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}