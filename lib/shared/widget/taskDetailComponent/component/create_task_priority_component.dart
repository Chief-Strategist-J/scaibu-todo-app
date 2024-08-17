import 'package:todo_app/core/app_library.dart';

class CreateTaskPriorityComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam localTodoData;

  const CreateTaskPriorityComponent({
    required TaskDetailComponentVariantStyle style,
    required this.localTodoData,
    super.key,
  }) : _style = style;

  void _onTapOfPriority(BuildContext context, PriorityModel priority) {
    context.read<TaskDetailBloc>().add(UpdatePriorityEvent(priority: priority));
    localTodoData.priority = priority.code;
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: _style.dialogStyle(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          8.height,
          Center(child: Text("Priority", style: boldTextStyle(size: 20))),
          ListView.separated(
            itemCount: priorityList.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(thickness: 0.5),
            itemBuilder: (context, index) {
              final priority = priorityList[index];

              return InkWell(
                onTap: () {
                  _onTapOfPriority(context, priority);
                },
                child: HBox(
                  style: _style.taskPriority(),
                  children: [
                    CircleAvatar(
                      backgroundColor: priority.color,
                      child: SvgPicture.asset(
                        Assets.iconIcFilledFlag,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        height: 21,
                        width: 21,
                      )
                      ,
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
}
