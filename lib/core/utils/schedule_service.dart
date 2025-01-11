import 'package:todo_app/core/app_library.dart';

ScheduleService scheduleService = getIt<ScheduleService>();

class ScheduleService {
  Future<void> performActionAfterTime({
    required final DateTime dateTime,
    required final void Function() action,
  }) async =>
      Future<void>.delayed(dateTime.difference(DateTime.now()))
          .then((final void value) => action.call());
}
