import 'package:todo_app/core/app_library.dart';

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
            Center(child: Text("Priority", style: boldTextStyle(size: 16))),
            16.height,
            ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text("data");
              },
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
