import 'package:todo_app/core/app_library.dart';

import 'project_item_component.style.dart';
import 'project_item_component.variant.dart';

class ProjectItemComponent extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final ProjectItemComponentVariant variant;

  const ProjectItemComponent({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    this.variant = ProjectItemComponentVariant.basic,
  });

  @override
  Widget build(BuildContext context) {
    final style = ProjectItemComponentStyle(variant);

    return PressableBox(
      style: style.containerStyle(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: style.titleStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(description, style: style.descriptionStyle(), maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
