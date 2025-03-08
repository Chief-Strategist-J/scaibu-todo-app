import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/feature/notification/data/model/notification_model.dart';

part 'notification_entity.freezed.dart';

part 'notification_entity.g.dart';

/// Doc Required
@freezed
abstract class NotificationEntity
    with _$NotificationEntity, NotificationEntityMixin {
  /// Doc Required
  const factory NotificationEntity({
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
    final DateTime? deletedAt,
  }) = _NotificationEntity;

  const NotificationEntity._();

  /// Doc Required
  factory NotificationEntity.fromJson(final Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}
