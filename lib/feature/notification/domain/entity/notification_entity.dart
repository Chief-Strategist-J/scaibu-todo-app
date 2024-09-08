import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/feature/notification/data/model/notification_model.dart';

part 'notification_entity.freezed.dart';
part 'notification_entity.g.dart';

@freezed
class NotificationEntity with _$NotificationEntity, NotificationEntityMixin {
  const factory NotificationEntity({
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
    DateTime? deletedAt,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => _$NotificationEntityFromJson(json);
}
