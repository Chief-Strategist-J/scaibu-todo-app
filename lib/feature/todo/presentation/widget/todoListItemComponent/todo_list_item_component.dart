import 'package:todo_app/core/todo_library.dart';

class TodoListItemComponent extends StatelessWidget {
  final TodoEntity todoData;
  final ValueChanged<bool?>? onChanged;
  final DismissDirectionCallback? onDismissed;
  final GestureTapCallback onTapOfEdit;
  final TodoListItemComponentVariant variant;

  final ValueKey uniqueKey;

  const TodoListItemComponent({
    super.key,
    required this.todoData,
    required this.onChanged,
    required this.uniqueKey,
    this.onDismissed,
    required this.onTapOfEdit,
    this.variant = TodoListItemComponentVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final style = TodoListItemComponentStyle(variant: variant);

    return Dismissible(
      key: uniqueKey,
      background: const BackgroundComponent(icon: Icons.archive),
      secondaryBackground: const BackgroundComponent(variant: BackgroundComponentVariant.delete, icon: Icons.delete),
      onDismissed: onDismissed,
      child: PressableBox(
        style: style.style(context),
        child: Row(
          children: [
            Checkbox(
              value: todoData.isCompleted ?? false,
              onChanged: onChanged,
            ),
            4.width,
            Expanded(
              child: VBox(
                style: style.columnStyleOfStartMin(context),
                children: [
                  StyledText(todoData.title ?? '', style: style.style(context)),
                  StyledText(todoData.description ?? '', style: style.style(context, fontWeight: FontWeight.normal)),
                  HBox(
                    style: style.rawStyleOfStartMin(context, sizeBetweenChildren: 2),
                    children: [
                      Icon(Icons.calendar_month, size: 12, color: greenColor),
                      2.width,
                      StyledText('2:00 AM', style: style.style(context, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            HBox(
              style: style.rawStyleOfStartMin(context),
              children: [
                Icon(Icons.flag, size: 22),
                GestureDetector(
                  child: Icon(Icons.edit, size: 22),
                  onTap: onTapOfEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
