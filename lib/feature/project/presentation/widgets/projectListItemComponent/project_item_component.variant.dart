import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ProjectItemComponentVariant extends Variant {
  const ProjectItemComponentVariant._(super.name);

  /// Doc Required
  static const ProjectItemComponentVariant basic =
      ProjectItemComponentVariant._('project.basic');

  /// Doc Required
  static const ProjectItemComponentVariant highlighted =
      ProjectItemComponentVariant._('project.highlighted');

  /// Doc Required
  static const ProjectItemComponentVariant dark =
      ProjectItemComponentVariant._('project.dark');

  /// Doc Required
  static const ProjectItemComponentVariant flat =
      ProjectItemComponentVariant._('project.flat');
}
