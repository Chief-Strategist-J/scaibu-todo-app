import 'package:todo_app/core/app_library.dart';

sealed class NotificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitNotificationState extends NotificationState {}

class NotificationEmptyState extends NotificationState {}

class NotificationDataState extends NotificationState {
  final List<NotificationEntity> notifications;
  final bool hasError;
  final String? errorMessage;
  final bool isEmpty;

  NotificationDataState({
    this.notifications = const [],
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
  });

  @override
  List<Object?> get props => [notifications, hasError, errorMessage, isEmpty];
}

class NotificationErrorState extends NotificationState {
  final String errorMessage;

  NotificationErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class NotificationLoadingState extends NotificationState {
  final bool isInitialLoad;

  NotificationLoadingState({this.isInitialLoad = false});

  @override
  List<Object?> get props => [isInitialLoad];
}

class NotificationOperationState extends NotificationState {
  final bool isProcessing;
  final String? operationMessage;

  NotificationOperationState({
    this.isProcessing = true,
    this.operationMessage,
  });

  @override
  List<Object?> get props => [isProcessing, operationMessage];
}
