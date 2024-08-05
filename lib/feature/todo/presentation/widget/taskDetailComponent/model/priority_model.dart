import 'package:todo_app/core/app_library.dart';

class PriorityModel {
  final String title;
  final String code;
  final Color color;

  PriorityModel({
    required this.title,
    required this.code,
    required this.color,
  });
}

List<String> priorityList = [
  'High Priority',
  'Medium Priority',
  'Low Priority',
  'No Priority',
];

