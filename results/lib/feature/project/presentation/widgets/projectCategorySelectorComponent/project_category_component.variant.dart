import 'package:todo_app/core/app_library.dart';

class ProjectCategoryComponentVariant extends Variant {
  const ProjectCategoryComponentVariant._(super.name);

  static const light = ProjectCategoryComponentVariant._('custom.light');
  static const dark = ProjectCategoryComponentVariant._('custom.dark');
  static const elevated = ProjectCategoryComponentVariant._('custom.elevated');
  static const flat = ProjectCategoryComponentVariant._('custom.flat');
}