import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoro_component.style.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoro_component.variant.dart';

class PomodoroComponent extends HookWidget {
  final PomodoroComponentVariant _variant;

  const PomodoroComponent({
    PomodoroComponentVariant variant = PomodoroComponentVariant.primary,
    super.key,
  }) : _variant = variant;

  @override
  Widget build(BuildContext context) {
    final style = useMemoized(() => PomodoroComponentVariantStyle(variant: _variant), []);

    return HBox(
      style: style.rowStyle(context),
      children: [
        Expanded(
          flex: 10,
          child: HBox(
            style: style.rowStyle(context),
            children: [
              const Icon(Icons.watch_later_outlined),
              4.width,
              Text("Pomodoro", style: boldTextStyle()),
            ],
          ),
        ),
        Expanded(
          child: HBox(
            style: style.rowStyle(context),
            children: [
              const Text("3"),
              4.width,
              const Icon(Icons.watch_later_outlined, size: 14, color: Colors.red),
            ],
          ),
        )
      ],
    );
  }
}
