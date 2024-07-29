import 'dart:isolate';

import 'package:todo_app/core/app_library.dart';

ScheduleService scheduleService = getIt<ScheduleService>();

// Also add dispose function for all services
class ScheduleService {
  Future<void> performActionAfterTime({
    required DateTime dateTime,
    required void Function() action,
  }) async {
    await Future.delayed(dateTime.difference(DateTime.now())).then((value) {
      action.call();
    });
  }
}
