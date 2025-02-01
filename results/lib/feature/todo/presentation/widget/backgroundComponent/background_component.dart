import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.style.dart';

/// A BackgroundComponent class extending StatelessWidget.
class BackgroundComponent extends StatelessWidget {
  /// A `const` `BackgroundComponent` widget with optional `icon` and `variant`
  /// parameters, defaulting `variant` to `BackgroundComponentVariant.archive`.
  const BackgroundComponent({
    super.key,
    this.icon,
    this.variant = BackgroundComponentVariant.archive,
  });

  /// The variant of the background component that determines its style.
  final BackgroundComponentVariant variant;

  /// The optional icon to be displayed on the background component.
  final IconData? icon;

  @override
  Widget build(final BuildContext context) {
    final BackgroundComponentStyle style = BackgroundComponentStyle(variant);

    return PressableBox(
      style: style.container(context),
      child: HBox(
        style: style.rawAlignment(context),
        children: <Widget>[
          if (variant == BackgroundComponentVariant.archive) 16.width,
          Icon(icon, color: context.primaryColor),
          if (variant == BackgroundComponentVariant.delete) 16.width,
        ],
      ),
    );
  }
}
