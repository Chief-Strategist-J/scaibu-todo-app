import 'package:todo_app/core/app_library.dart';

/// Instance of [ScheduleService] retrieved from dependency injection container.
ScheduleService scheduleService = getIt<ScheduleService>();


/// Service to handle scheduling of actions to be performed at a later time.
class ScheduleService {
  /// Service to perform an action after a specific [dateTime].
  Future<void> performActionAfterTime({
    required final DateTime dateTime,
    required final void Function() action,
  }) async =>
      Future<void>.delayed(dateTime.difference(DateTime.now()))
          .then((final void value) => action.call());
}
