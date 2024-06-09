import 'package:todo_app/core/todo_library.dart';

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

  Future<String> selectTime(BuildContext context) async {
    final TimeOfDay? value = await _timePicker(context);
    if (value == null) return '';
    return _formatTimeOfDay(value);
  }

  Future<String> selectDate(BuildContext context) async {
    DateTime? picked = await _datePicker(context);
    if (picked == null) return '';
    return _dateFormat.format(picked);
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
        if (child == null) return Offstage();
        final data = MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false);
        return MediaQuery(data: data, child: child);
      },
    );
  }
}
