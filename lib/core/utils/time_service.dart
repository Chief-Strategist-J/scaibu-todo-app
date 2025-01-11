import 'package:todo_app/core/app_library.dart';

class TimeServiceModel {
  TimeServiceModel({
    required this.formatTimeInString,
    required this.dateTime,
    required this.isSelected,
    this.formatedStringTimeDuration,
    this.selectedTimeDuration,
  });
  final String formatTimeInString;
  final DateTime dateTime;
  final bool isSelected;

  final String? formatedStringTimeDuration;
  final Duration? selectedTimeDuration;
}

class TimeService {
  DateFormat get _dateFormat => DateFormat('d-MMMM-y', 'en');
  DateFormat get _timeFormat => DateFormat('hh:mm a', 'en_US');

  DateTime get _currentDateTime => DateTime.now();
  DateTime get _calendarEndDateTime => DateTime(2101);
  DateTime get _calendarStartingDateTime => DateTime(2000);

  String get initialDate => _dateFormat.format(_currentDateTime);
  String get currentTime => _timeFormat.format(_currentDateTime);
  TimeOfDay get timeOfDay =>
      TimeOfDay(hour: _currentDateTime.hour, minute: _currentDateTime.minute);

  Future<String> currentTimeAfterMinute({final int minutes = 30}) async =>
      _timeFormat.format(_currentDateTime.add(Duration(minutes: minutes)));

  String _formatTimeOfDay(final TimeOfDay time) {
    final String formattedHour = time.hourOfPeriod.toString().padLeft(2, '0');
    final String formattedMinute = time.minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
  }

  Duration _convertDateTimeRangeToDuration(final DateTimeRange range) =>
      range.end.difference(range.start);

  String _convertDurationToString(final Duration duration) {
    final String hours = duration.inHours.toString().padLeft(2, '0');
    final String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    return '$hours:$minutes Hours';
  }

  DateTime _convertTimeOfDayToDateAndTime(final TimeOfDay timeOfDay) =>
      DateTime.now().copyWith(hour: timeOfDay.hour, minute: timeOfDay.minute);

  Future<DateTime?> _datePicker(final BuildContext context) async =>
      await showDatePicker(
        context: context,
        initialDate: _currentDateTime,
        firstDate: _calendarStartingDateTime,
        lastDate: _calendarEndDateTime,
      );

  Future<TimeOfDay?> _timePicker(final BuildContext context) async =>
      await showTimePicker(
        context: context,
        initialTime: timeOfDay,
        builder: (final BuildContext context, final Widget? child) =>
            MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? const Offstage(),
        ),
      );

  Future<DateTimeRange?> _dateRangePicker(final BuildContext context) async =>
      await showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(
          start: _currentDateTime,
          end: _currentDateTime.add(const Duration(days: 7)),
        ),
        firstDate: _calendarStartingDateTime,
        lastDate: _calendarEndDateTime,
        builder: (final BuildContext context, final Widget? child) =>
            MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? const Offstage(),
        ),
      );

  Future<TimeServiceModel> selectTimeRange(final BuildContext context) async {
    final DateTimeRange? value = await _dateRangePicker(context);
    final Duration? selectedDuration =
        value != null ? _convertDateTimeRangeToDuration(value) : null;

    return TimeServiceModel(
      isSelected: value != null,
      formatTimeInString: _formatTimeOfDay(timeOfDay),
      dateTime: _convertTimeOfDayToDateAndTime(timeOfDay),
      selectedTimeDuration: selectedDuration,
      formatedStringTimeDuration: selectedDuration != null
          ? _convertDurationToString(selectedDuration)
          : null,
    );
  }

  Future<TimeServiceModel> selectTime(final BuildContext context) async {
    final TimeOfDay? value = await _timePicker(context);
    return TimeServiceModel(
      isSelected: value != null,
      formatTimeInString: _formatTimeOfDay(value ?? timeOfDay),
      dateTime: _convertTimeOfDayToDateAndTime(value ?? timeOfDay),
    );
  }

  Future<TimeServiceModel> selectDate(final BuildContext context) async {
    final DateTime? picked = await _datePicker(context);
    return TimeServiceModel(
      isSelected: picked != null,
      formatTimeInString: _dateFormat.format(picked ?? _currentDateTime),
      dateTime: picked ?? _currentDateTime,
    );
  }

  String convertToDate(final DateTime date) => _dateFormat.format(date);

  String convertToTime(final DateTime dateTime) =>
      _formatTimeOfDay(TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  DateTime parseDateTimeISO8601(String dateTimeString) {
    if (dateTimeString.isEmpty) return DateTime.now();
    if (dateTimeString.endsWith('Z')) {
      dateTimeString = dateTimeString.replaceFirst('Z', '+00:00');
    }
    return DateTime.parse(dateTimeString);
  }
}
