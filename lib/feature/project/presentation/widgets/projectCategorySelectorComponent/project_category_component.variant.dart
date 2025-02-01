import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ProjectCategoryComponentVariant extends Variant {
  const ProjectCategoryComponentVariant._(super.name);

  /// Doc Required
  static const ProjectCategoryComponentVariant light =
      ProjectCategoryComponentVariant._('custom.light');

  /// Doc Required
  static const ProjectCategoryComponentVariant dark =
      ProjectCategoryComponentVariant._('custom.dark');

  /// Doc Required
  static const ProjectCategoryComponentVariant elevated =
      ProjectCategoryComponentVariant._('custom.elevated');

  /// Doc Required
  static const ProjectCategoryComponentVariant flat =
      ProjectCategoryComponentVariant._('custom.flat');
}
