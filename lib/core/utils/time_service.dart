import 'package:todo_app/core/app_library.dart';

/// A entity representing time-related information and selections.
class TimeServiceModel {
  /// Creates an instance of [TimeServiceModel].
  ///
  /// [formatTimeInString] is the time in string format.
  /// [dateTime] is the corresponding [DateTime] object.
  /// [isSelected] indicates whether the time is selected.
  /// [formatedStringTimeDuration] is an optional formatted string
  /// of time duration.
  /// [selectedTimeDuration] is an optional [Duration]
  /// representing the selected time.
  TimeServiceModel({
    required this.formatTimeInString,
    required this.dateTime,
    required this.isSelected,
    this.formatedStringTimeDuration,
    this.selectedTimeDuration,
  });

  /// The time represented as a string.
  final String formatTimeInString;

  /// The corresponding [DateTime] object.
  final DateTime dateTime;

  /// Indicates whether the time is selected.
  final bool isSelected;

  /// An optional formatted string representing time duration.
  final String? formatedStringTimeDuration;

  /// An optional [Duration] representing the selected time duration.
  final Duration? selectedTimeDuration;
}

/// A service that provides formatted date, time, and time-related information.
class TimeService {
  DateFormat get _dateFormat => DateFormat('d-MMMM-y', 'en');
  DateFormat get _timeFormat => DateFormat('hh:mm a', 'en_US');

  DateTime get _currentDateTime => DateTime.now();
  DateTime get _calendarEndDateTime => DateTime(2101);
  DateTime get _calendarStartingDateTime => DateTime(2000);

  /// Returns the formatted initial date as a string (yyyy-MM-dd).
  String get initialDate => _dateFormat.format(_currentDateTime);

  /// Returns the current time formatted as a string (HH:mm).
  String get currentTime => _timeFormat.format(_currentDateTime);

  /// Returns the [TimeOfDay] representation of the current time.
  TimeOfDay get timeOfDay =>
      TimeOfDay(hour: _currentDateTime.hour, minute: _currentDateTime.minute);

  /// Returns the time after a specified number of minutes, formatted as a
  /// string.
  Future<String> currentTimeAfterMinute({final int minutes = 30}) async =>
      _timeFormat.format(_currentDateTime.add(Duration(minutes: minutes)));

  String _formatTimeOfDay(final TimeOfDay time) {
    final String formattedHour = time.hourOfPeriod.toString().padLeft(2, '0');
    final String formattedMinute = time.minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute '
        '${time.period == DayPeriod.am ? 'AM' : 'PM'}';
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
      showDatePicker(
        context: context,
        initialDate: _currentDateTime,
        firstDate: _calendarStartingDateTime,
        lastDate: _calendarEndDateTime,
      );

  Future<TimeOfDay?> _timePicker(final BuildContext context) async =>
      showTimePicker(
        context: context,
        initialTime: timeOfDay,
        builder: (final BuildContext context, final Widget? child) =>
            MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? const Offstage(),
        ),
      );

  Future<DateTimeRange?> _dateRangePicker(final BuildContext context) async =>
      showDateRangePicker(
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

  /// Prompts the user to select a time range and returns the selected time.
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

  /// Prompts the user to select a time and returns the selected time.
  Future<TimeServiceModel> selectTime(final BuildContext context) async {
    final TimeOfDay? value = await _timePicker(context);
    return TimeServiceModel(
      isSelected: value != null,
      formatTimeInString: _formatTimeOfDay(value ?? timeOfDay),
      dateTime: _convertTimeOfDayToDateAndTime(value ?? timeOfDay),
    );
  }

  /// Prompts the user to select a date and returns the selected date.
  Future<TimeServiceModel> selectDate(final BuildContext context) async {
    final DateTime? picked = await _datePicker(context);
    return TimeServiceModel(
      isSelected: picked != null,
      formatTimeInString: _dateFormat.format(picked ?? _currentDateTime),
      dateTime: picked ?? _currentDateTime,
    );
  }

  /// Converts a [DateTime] to a formatted date string.
  String convertToDate(final DateTime date) => _dateFormat.format(date);

  /// Converts a [DateTime] to a formatted time string.
  String convertToTime(final DateTime dateTime) =>
      _formatTimeOfDay(TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  /// Parses an ISO 8601 formatted [String] to a [DateTime] object.
  DateTime parseDateTimeISO8601(final String dateTimeString) {
    if (dateTimeString.isEmpty) {
      return DateTime.now();
    }
    if (dateTimeString.endsWith('Z')) {
      return DateTime.parse(dateTimeString.replaceFirst('Z', '+00:00'));
    }
    return DateTime.parse(dateTimeString);
  }
}
