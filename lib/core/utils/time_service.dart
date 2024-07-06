import 'package:todo_app/core/app_library.dart';

class TimeServiceModel {
  final String formatTimeInString;
  final DateTime dateTime;

  TimeServiceModel({
    required this.formatTimeInString,
    required this.dateTime,
  });
}

class TimeService {
  DateFormat get _dateFormat => DateFormat('d-MMMM-y', 'en');

  DateFormat get _timeFormat => DateFormat('hh:mm a', 'en_US');

  DateTime get _currentDateTime => DateTime.now();

  DateTime get _calenderEndDateTime => DateTime(2101);

  DateTime get _calenderStartingDateTime => DateTime(2000);

  String get initialDate => _dateFormat.format(_currentDateTime);

  String get currentTime => _timeFormat.format(_currentDateTime);

  TimeOfDay get timeOfDay => TimeOfDay(hour: _currentDateTime.hour, minute: _currentDateTime.minute);

  String currentTimeAfterMinute({int minutes = 30}) {
    return _timeFormat.format(_currentDateTime.add(Duration(minutes: minutes)));
  }

  String _formatTimeOfDay(TimeOfDay time) {
    int hour = time.hourOfPeriod;
    int minute = time.minute;
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';

    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');

    return '$formattedHour:$formattedMinute $period';
  }

  Future<TimeServiceModel> selectTime(BuildContext context) async {
    final TimeOfDay? value = await _timePicker(context);

    final TimeServiceModel time = TimeServiceModel(
      formatTimeInString: (value == null) ? _formatTimeOfDay(timeOfDay) : _formatTimeOfDay(value),
      dateTime: (value == null) ? _convertTimeOfDayToDateAndTime(timeOfDay) : _convertTimeOfDayToDateAndTime(value),
    );

    return time;
  }

  DateTime _convertTimeOfDayToDateAndTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  Future<TimeServiceModel> selectDate(BuildContext context) async {
    DateTime? picked = await _datePicker(context);
    final TimeServiceModel time = TimeServiceModel(
      formatTimeInString: (picked == null) ? _dateFormat.format(_currentDateTime) : _dateFormat.format(picked),
      dateTime: (picked == null) ? _currentDateTime : picked,
    );

    return time;
  }

  String convertToDate(DateTime date) {
    return _dateFormat.format(date);
  }

  String convertToTime(DateTime dateTime) {
    final timeOfDay = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
    return _formatTimeOfDay(timeOfDay);
  }

  Future<DateTime?> _datePicker(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: _currentDateTime,
      firstDate: _calenderStartingDateTime,
      lastDate: _calenderEndDateTime,
    );
  }

  Future<TimeOfDay?> _timePicker(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: timeOfDay,
      builder: (BuildContext context, Widget? child) {
        if (child == null) return const Offstage();
        final data = MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false);
        return MediaQuery(data: data, child: child);
      },
    );
  }
}
