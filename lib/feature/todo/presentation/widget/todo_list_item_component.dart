import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.dart';
import 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.variant.dart';

class TodoListItemComponent extends StatelessWidget {
  final TodoEntity todoData;
  final ValueChanged<bool?>? onChanged;
  final DismissDirectionCallback? onDismissed;
  final GestureTapCallback onTapOfEdit;

  final ValueKey uniqueKey;

  const TodoListItemComponent({
    super.key,
    required this.todoData,
    required this.onChanged,
    required this.uniqueKey,
    this.onDismissed,
    required this.onTapOfEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: uniqueKey,
      background: const BackgroundComponent(icon: Icons.archive),
      secondaryBackground: const BackgroundComponent(variant: BackgroundComponentVariant.delete, icon: Icons.delete),
      onDismissed: onDismissed,
      child: Container(
        margin: EdgeInsets.only(top: 6, bottom: 6),
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(23),
          boxShadow: [
            AppThemeData.defaultBoxShadow,
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              value: todoData.isCompleted ?? false,
              onChanged: onChanged,
            ),
            4.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '',
                      style: primaryTextStyle(size: 14),
                      children: [
                        TextSpan(
                          text: todoData.title ?? '',
                          style: boldTextStyle(size: 14),
                        ),
                      ],
                    ),
                  ),
                  4.height,
                  Text.rich(
                    TextSpan(
                      text: '',
                      style: primaryTextStyle(size: 14),
                      children: [
                        TextSpan(
                          text: todoData.description ?? '',
                          style: boldTextStyle(size: 14),
                        ),
                      ],
                    ),
                  ),
                  4.height,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_month, size: 12, color: greenColor),
                      2.width,
                      Text(
                        '2:00 AM',
                        style: boldTextStyle(color: greenColor, size: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.flag, size: 22),
                8.width,
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
