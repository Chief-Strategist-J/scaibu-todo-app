import 'package:todo_app/core/app_library.dart';


/// Doc Required
class ProjectItemComponent extends StatelessWidget {
  /// Doc Required
  const ProjectItemComponent({
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
    this.variant = ProjectItemComponentVariant.basic,
  });

  /// Doc Required
  final String title;

  /// Doc Required
  final String description;

  /// Doc Required
  final VoidCallback onTap;

  /// Doc Required
  final ProjectItemComponentVariant variant;

  @override
  Widget build(final BuildContext context) {
    final ProjectItemComponentStyle style = ProjectItemComponentStyle(variant);

    return PressableBox(
      style: style.containerStyle(context),
      onPress: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: style.titleStyle(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: style.descriptionStyle(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
