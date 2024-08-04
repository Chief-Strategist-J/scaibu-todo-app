import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoro_component.variant.dart';

class PomodoroComponentVariantStyle {
  final PomodoroComponentVariant variant;

  PomodoroComponentVariantStyle({required this.variant});

  Style rowStyle(
    BuildContext context, {
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return Style().applyVariants([variant]);
  }
}
