import 'package:todo_app/core/app_library.dart';

/// Doc Required
class CreateTaskPriorityComponent extends StatelessWidget {
  /// Doc Required
  const CreateTaskPriorityComponent({
    required final TaskDetailComponentVariantStyle style,
    required final ManageTodoPageParam localTodoData,
    super.key,
  })  : _localTodoData = localTodoData,
        _style = style;
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam _localTodoData;

  void _onTapOfPriority(
    final BuildContext context,
    final PriorityModel priority,
  ) {
    context.read<TaskDetailBloc>().add(UpdatePriorityEvent(priority: priority));
    _localTodoData.priority = priority.code;
    GoRouter.of(context).pop();
  }

  @override
  Widget build(final BuildContext context) => PressableBox(
        style: _style.dialogStyle(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            8.height,
            Center(child: Text('Priority', style: boldTextStyle(size: 20))),
            ListView.separated(
              itemCount: priorityList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (final BuildContext context, final int index) =>
                  const Divider(thickness: 0.5),
              itemBuilder: (final BuildContext context, final int index) {
                final PriorityModel priority = priorityList[index];

                return InkWell(
                  onTap: () {
                    _onTapOfPriority(context, priority);
                  },
                  child: HBox(
                    style: _style.taskPriority(),
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: priority.color,
                        child: SvgPicture.asset(
                          Assets.iconIcFilledFlag,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 21,
                          width: 21,
                        ),
                      ),
                      16.width,
                      Text(priority.title),
                    ],
                  ),
                );
              },
            ),
            16.height,
          ],
        ),
      );
}
