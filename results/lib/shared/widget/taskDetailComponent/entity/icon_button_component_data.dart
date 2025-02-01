import 'package:todo_app/core/app_library.dart'
    show
        Assets,
        BuildContext,
        ChildClassType,
        GestureTapCallback,
        SelectContext,
        TaskDetailBloc,
        TaskDetailDataState,
        TaskDetailState;

/// Doc Required
class IconButtonComponentData {
  /// Doc Required
  IconButtonComponentData({
    required this.text,
    required this.icon,
    this.prefixText,
    this.onTap,
  });

  /// Doc Required
  factory IconButtonComponentData.createOption({
    required final String text,
    required final String icon,
    final String? prefixText,
    final GestureTapCallback? onTap,
  }) =>
      IconButtonComponentData(
        text: text,
        icon: icon,
        prefixText: prefixText,
        onTap: onTap,
      );

  /// Doc Required
  final String text;

  /// Doc Required
  final String? prefixText;

  /// Doc Required
  final String icon;

  /// Doc Required
  final GestureTapCallback? onTap;

  /// Doc Required
  static List<IconButtonComponentData> listOfOptions({
    required final void Function(ChildClassType) handleTap,
    required final BuildContext ctx,
  }) {
    final int pomodoroCount = _getPomodoroCount(ctx);

    return <IconButtonComponentData>[
      IconButtonComponentData.createOption(
        text: 'Priority',
        icon: Assets.iconIcFlag,
        onTap: () => handleTap(ChildClassType.createPriority),
      ),
      IconButtonComponentData.createOption(
        text: 'Pomodoro',
        icon: Assets.iconIcFilledSun,
        prefixText: '$pomodoroCount',
        onTap: () => handleTap(ChildClassType.createPomodoro),
      ),
      IconButtonComponentData.createOption(
        text: 'Tags',
        icon: Assets.iconIcTag,
        onTap: () => handleTap(ChildClassType.createTags),
      ),
      IconButtonComponentData.createOption(
        text: 'Project',
        icon: Assets.iconIcOfficeBag,
        onTap: () => handleTap(ChildClassType.createProject),
      ),
    ];
  }

  static int _getPomodoroCount(final BuildContext ctx) =>
      ctx.select((final TaskDetailBloc value) {
        final TaskDetailState state = value.state;
        return state is TaskDetailDataState ? state.pomodoroCont ?? 0 : 0;
      });
}
