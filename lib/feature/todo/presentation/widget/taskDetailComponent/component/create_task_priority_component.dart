import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/taskDetailComponent/model/priority_model.dart';

class CreateTaskPriorityComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;

  const CreateTaskPriorityComponent({
    required TaskDetailComponentVariantStyle style,
    super.key,
  }) : _style = style;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: PressableBox(
        style: _style.dialogStyle(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text("Priority", style: boldTextStyle(size: 20))),
            16.height,
            ListView.builder(
              itemCount: priorityList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final priority = priorityList[index];

                return GestureDetector(
                  onTap: () {
                    context.read<TaskDetailBloc>().add(UpdatePriorityEvent(priority: priority));
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(color: cardColor.withOpacity(0.2)),
                      bottom: BorderSide(color: cardColor.withOpacity(0.2)),
                    )),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: priority.color,
                          child: SvgPicture.asset(
                            Assets.iconIcFilledFlag,
                            color: Colors.white,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        8.width,
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
      ),
    );
  }
}
