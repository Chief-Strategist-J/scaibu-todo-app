import 'package:todo_app/core/app_library.dart';

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
        child: AnimatedScrollView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Estimated Pomodoros : ", style: boldTextStyle(size: 16)),
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
                Text("Estimated Pomodoro Time: ", style: boldTextStyle(size: 16)),
                16.height,
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PomodoroCont(index: (index + 1) * 10);
                    },
                  ),
                ),
                Text("Remind Before Pomodoro Complete Time: ", style: boldTextStyle(size: 16)),
                16.height,
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PomodoroCont(index: (index + 1) * 5);
                    },
                  ),
                ),
                16.height,
                TagButtonComponent(
                  onTapOfCancel: () {
                    //
                  },
                  onTapOfAdd: () {
                    toast("added");
                    final Map<String, dynamic> request = {
                      "title": "Focus Session",
                      "duration": 1,
                      "status": "pending",
                      "todo_id": localTodoData.todoId,
                      "user_id": userCredentials.getUserId,
                      "number_of_pomodoros": 5,
                    };
                    final createPomodoro = getIt<CreatePomodoroUseCase>(instanceName: PomodoroDependencyInjection.createPomodoroUseCase);
                    createPomodoro(request);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
