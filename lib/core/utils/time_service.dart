import 'package:todo_app/core/todo_library.dart';

class TimeService {
  Future<String> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

    TimeOfDay? selectedTime24Hour = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        if (child == null) return Offstage();

        final data = MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false);
        return MediaQuery(data: data, child: child);
      },
    );

    final value = await selectedTime24Hour;

    if (value == null) return '';

    return "${value.hour}" + " : " + "${value.minute}";
  }

  Future<String> selectDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(2000);
    final lastDate = DateTime(2101);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked == null) return '';

    return "${picked.day}" + "/" + "${picked.month}" + "/" + "${picked.year}";
  }
}
