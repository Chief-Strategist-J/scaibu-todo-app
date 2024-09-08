import 'package:todo_app/core/app_library.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(InitNotificationState()) {
    on<InitNotificationEvent>(_init);
  }

  void _init(InitNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(InitNotificationState());
  }
}
