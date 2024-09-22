import 'package:todo_app/core/app_library.dart';

class ListItemComponent<T> extends StatelessWidget {
  final T item;
  final String name;
  final String slug;
  final bool isTag;
  final Color Function() getColor;
  final void Function() onTap;

  const ListItemComponent({
    required this.item,
    required this.name,
    required this.slug,
    required this.isTag,
    required this.getColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isItemAlreadySelected = context.select(
      (TaskDetailBloc taskDetailBloc) {
        final state = taskDetailBloc.state;
        if (state is TaskDetailDataState) {
          if (isTag) {
            return state.selectedTagList.any((element) => element.slug == slug);
          } else {
            return state.selectedProjectList.any((element) => element.slug == slug);
          }
        } else {
          return false;
        }
      },
    );

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.iconIcFilledTag,
                    height: 21,
                    width: 21,
                    colorFilter: ColorFilter.mode(isTag ? getColor() : blackColor, BlendMode.srcIn),
                  ),
                  16.width,
                  Text(name.validate()),
                ],
              ),
            ),
            if (isItemAlreadySelected) Icon(Icons.check, color: isTag ? getColor() : blackColor),
          ],
        ),
      ),
    );
  }
}
