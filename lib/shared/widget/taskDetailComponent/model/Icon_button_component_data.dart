import 'package:todo_app/core/app_library.dart';

class IconButtonComponentData {
  final String text;
  final String? prefixText;
  final String icon;
  final GestureTapCallback? onTap;

  IconButtonComponentData({
    required this.text,
    required this.icon,
    this.prefixText,
    this.onTap,
  });

  static List<IconButtonComponentData> listOfOptions({
    required void Function(ChildClassType) handleTap,
    required BuildContext ctx,
  }) {
    final int pomodoroCount = _getPomodoroCount(ctx);

    return [
      _createOption(
        text: "Priority",
        icon: Assets.iconIcFlag,
        onTap: () => handleTap(ChildClassType.createPriority),
      ),
      _createOption(
        text: "Pomodoro",
        icon: Assets.iconIcFilledSun,
        prefixText: "$pomodoroCount",
        onTap: () => handleTap(ChildClassType.createPomodoro),
      ),
      _createOption(
        text: "Tags",
        icon: Assets.iconIcTag,
        onTap: () => handleTap(ChildClassType.createTags),
      ),
      _createOption(
        text: "Project",
        icon: Assets.iconIcOfficeBag,
        onTap: () => handleTap(ChildClassType.createProject),
      ),
    ];
  }

  static IconButtonComponentData _createOption({required String text, required String icon, String? prefixText, GestureTapCallback? onTap}) {
    return IconButtonComponentData(text: text, icon: icon, prefixText: prefixText, onTap: onTap);
  }

  static int _getPomodoroCount(BuildContext ctx) {
    return ctx.select((TaskDetailBloc value) {
      final state = value.state;
      return state is TaskDetailDataState ? state.pomodoroCont ?? 0 : 0;
    });
  }
}
