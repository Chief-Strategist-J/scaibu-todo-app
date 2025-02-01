import 'package:todo_app/core/app_library.dart';

class ProjectItemComponentVariant extends Variant {
  const ProjectItemComponentVariant._(super.name);

  static const basic = ProjectItemComponentVariant._('project.basic');
  static const highlighted = ProjectItemComponentVariant._('project.highlighted');
  static const dark = ProjectItemComponentVariant._('project.dark');
  static const flat = ProjectItemComponentVariant._('project.flat');
}
