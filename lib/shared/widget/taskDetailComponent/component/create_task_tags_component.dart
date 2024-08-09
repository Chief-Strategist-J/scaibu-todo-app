import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/shared/widget/taskDetailComponent/model/priority_model.dart';

class CreateTaskTagsComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  const CreateTaskTagsComponent({required TaskDetailComponentVariantStyle style, super.key}) : _style = style;

  void _onTapOfPriority(BuildContext context, PriorityModel priority) {
    context.read<TaskDetailBloc>().add(UpdatePriorityEvent(priority: priority));
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
          Center(child: Text("Tags", style: boldTextStyle(size: 20))),
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
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.iconIcFilledTag,
                        color: priority.color,
                        height: 21,
                        width: 21,
                      ),
                      16.width,
                      Text(priority.title),
                    ],
                  ),
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
