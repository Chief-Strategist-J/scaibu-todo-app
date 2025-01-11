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
    required final int id,
    required final int userId,
    @Default('New Notification') final String title,
    final String? message,
    @Default('general') final String type,
    @Default('unread') final String status,
    @Default(false) final bool isSeen,
    @Default(false) final bool isArchived,
    @Default('medium') final String priority,
    final DateTime? sentAt,
    final DateTime? readAt,
    final DateTime? archivedAt,
    final DateTime? deletedAt,
    final String? url,
    final String? icon,
    final Map<String, dynamic>? metadata,
    final String? metadataAction,
    final String? metadataTarget,
    @Default(0) final int flags,
    @Default('web') final String platform,
    @Default(0) final int clickCount,
    @Default(0) final int retryCount,
    final double? deliveryTime,
    final int? responseCode,
    required final String uuid,
    required final int createdAt,
    required final int updatedAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(final Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
