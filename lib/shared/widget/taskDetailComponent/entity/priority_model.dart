import 'package:todo_app/core/app_library.dart';

/// Doc Required
class PriorityModel {
  /// Doc Required
  PriorityModel({
    required this.title,
    required this.code,
    required this.color,
  });

  /// Doc Required
  final String title;

  /// Doc Required
  final String code;

  /// Doc Required
  final Color color;
}

/// Doc Required
List<PriorityModel> priorityList = <PriorityModel>[
  PriorityModel(title: 'High Priority', code: 'high_priority', color: redColor),
  PriorityModel(
    title: 'Medium Priority',
    code: 'medium_priority',
    color: orange,
  ),
  PriorityModel(title: 'Low Priority', code: 'low_priority', color: limeGreen),
  PriorityModel(title: 'No Priority', code: 'no_priority', color: slateGray),
];
