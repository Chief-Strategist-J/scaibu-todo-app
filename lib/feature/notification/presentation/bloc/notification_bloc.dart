import 'package:todo_app/core/app_library.dart';

/// Doc Required
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  /// Doc Required
  NotificationBloc() : super(InitNotificationState()) {
    on<InitNotificationEvent>(_init);
  }

  Future<void> _init(
    final InitNotificationEvent event,
    final Emitter<NotificationState> emit,
  ) async {
    emit(InitNotificationState());
  }
}
