import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/notification/presentation/bloc/notification_state.dart';

import 'notification_event.dart';


class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<NotificationState> emit) async {
    emit(state.clone());
  }
}
