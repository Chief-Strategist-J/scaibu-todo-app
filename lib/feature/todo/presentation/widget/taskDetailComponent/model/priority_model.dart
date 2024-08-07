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

  List<PriorityModel> priorityList = [
    PriorityModel(title: 'High Priority', code: "high_priority", color: redColor),
    PriorityModel(title: 'Medium Priority', code: "medium_priority", color: orange),
    PriorityModel(title: 'Low Priority', code: "low_priority", color: limeGreen),
    PriorityModel(title: 'No Priority', code: "no_priority", color: slateGray),
  ];
