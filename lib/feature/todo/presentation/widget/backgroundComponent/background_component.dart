import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.style.dart';
import 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.variant.dart';

class BackgroundComponent extends StatelessWidget {
  final BackgroundComponentVariant variant;
  final IconData? icon;
  const BackgroundComponent({
    super.key,
    this.variant = BackgroundComponentVariant.archive,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final style = BackgroundComponentStyle(variant);

    return PressableBox(
      style: style.container(context),
      child: HBox(
        style: style.rawAlignment(context),
        children: [
          if (variant == BackgroundComponentVariant.archive) 16.width,
          Icon(icon, color: context.primaryColor),
          if (variant == BackgroundComponentVariant.delete) 16.width,
        ],
      ),
    );
  }
}
