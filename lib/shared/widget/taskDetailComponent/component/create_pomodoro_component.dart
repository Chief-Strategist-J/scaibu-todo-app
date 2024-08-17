import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/shared/widget/taskDetailComponent/component/pomodoro_cont.dart';

class CreatePomodoroComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam localTodoData;

  const CreatePomodoroComponent({
    required TaskDetailComponentVariantStyle style,
    required this.localTodoData,
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
            Text("Estimated Pomodoro : ", style: boldTextStyle(size: 16)),
            16.height,
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PomodoroCont(index: index + 1);
                },
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
