import 'package:todo_app/core/app_library.dart';

/// Doc Required
sealed class NotificationState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class InitNotificationState extends NotificationState {}

/// Doc Required
class NotificationEmptyState extends NotificationState {}

/// Doc Required
class NotificationDataState extends NotificationState {
  /// Doc Required
  NotificationDataState({
    this.notifications = const <NotificationEntity>[],
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
  });

  /// Doc Required
  final List<NotificationEntity> notifications;

  /// Doc Required
  final bool hasError;

  /// Doc Required
  final String? errorMessage;

  /// Doc Required
  final bool isEmpty;

  @override
  List<Object?> get props =>
      <Object?>[notifications, hasError, errorMessage, isEmpty];
}

/// Doc Required
class NotificationErrorState extends NotificationState {
  /// Doc Required
  NotificationErrorState(this.errorMessage);

  /// Doc Required
  final String errorMessage;

  @override
  List<Object?> get props => <Object?>[errorMessage];
}

/// Doc Required
class NotificationLoadingState extends NotificationState {
  /// Doc Required
  NotificationLoadingState({this.isInitialLoad = false});

  /// Doc Required
  final bool isInitialLoad;

  @override
  List<Object?> get props => <Object?>[isInitialLoad];
}

/// Doc Required
class NotificationOperationState extends NotificationState {
  /// Doc Required
  NotificationOperationState({
    this.isProcessing = true,
    this.operationMessage,
  });

  /// Doc Required
  final bool isProcessing;

  /// Doc Required
  final String? operationMessage;

  @override
  List<Object?> get props => <Object?>[isProcessing, operationMessage];
}
