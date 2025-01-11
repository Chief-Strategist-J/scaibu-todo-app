import 'package:todo_app/core/app_library.dart';

sealed class NotificationState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class InitNotificationState extends NotificationState {}

class NotificationEmptyState extends NotificationState {}

class NotificationDataState extends NotificationState {
  NotificationDataState({
    this.notifications = const <NotificationEntity>[],
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
  });

  final List<NotificationEntity> notifications;
  final bool hasError;
  final String? errorMessage;
  final bool isEmpty;

  @override
  List<Object?> get props =>
      <Object?>[notifications, hasError, errorMessage, isEmpty];
}

class NotificationErrorState extends NotificationState {
  NotificationErrorState(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => <Object?>[errorMessage];
}

class NotificationLoadingState extends NotificationState {
  NotificationLoadingState({this.isInitialLoad = false});
  final bool isInitialLoad;

  @override
  List<Object?> get props => <Object?>[isInitialLoad];
}

class NotificationOperationState extends NotificationState {
  NotificationOperationState({
    this.isProcessing = true,
    this.operationMessage,
  });
  final bool isProcessing;
  final String? operationMessage;

  @override
  List<Object?> get props => <Object?>[isProcessing, operationMessage];
}
