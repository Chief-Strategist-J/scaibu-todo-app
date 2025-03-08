import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

/// Doc Required
mixin NotificationEntityMixin {
  /// Doc Required
  int get id;

  /// Doc Required
  int get userId;

  /// Doc Required
  String get title;

  /// Doc Required
  String? get message;

  /// Doc Required
  String get type;

  /// Doc Required
  String get status;

  /// Doc Required
  bool get isSeen;

  /// Doc Required
  bool get isArchived;

  /// Doc Required
  String get priority;

  /// Doc Required
  DateTime? get sentAt;

  /// Doc Required
  DateTime? get readAt;

  /// Doc Required
  DateTime? get archivedAt;

  /// Doc Required
  DateTime? get deletedAt;

  /// Doc Required
  String? get url;

  /// Doc Required
  String? get icon;

  /// Doc Required
  Map<String, dynamic>? get metadata;

  /// Doc Required
  String? get metadataAction;

  /// Doc Required
  String? get metadataTarget;

  /// Doc Required
  int get flags;

  /// Doc Required
  String get platform;

  /// Doc Required
  int get clickCount;

  /// Doc Required
  int get retryCount;

  /// Doc Required
  double? get deliveryTime;

  /// Doc Required
  int? get responseCode;

  /// Doc Required
  String get uuid;

  /// Doc Required
  int get createdAt;

  /// Doc Required
  int get updatedAt;
}

/// Doc Required
@freezed
abstract class NotificationModel
    with _$NotificationModel, NotificationEntityMixin {
  /// Doc Required
  const factory NotificationModel({
    required final int id,
    required final int userId,
    required final String uuid,
    required final int createdAt,
    required final int updatedAt,
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
  }) = _NotificationModel;

  const NotificationModel._();

  /// Doc Required
  factory NotificationModel.fromJson(final Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
