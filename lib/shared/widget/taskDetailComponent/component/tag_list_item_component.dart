import 'package:todo_app/core/app_library.dart';

class TagListItemComponent extends StatelessWidget {
  final TagEntity tag;

  const TagListItemComponent(this.tag, {super.key});

  Color get getColor => getIt<UtilityService>().stringToColor(tag.color ?? '0xFFFFEBEE');

  @override
  Widget build(BuildContext context) {
    final isTagAlreadySelected = context.select(
      (TaskDetailBloc taskDetailBloc) {
        final state = taskDetailBloc.state;
        if (state is TaskDetailDataState) {
          return state.selectedTagList.any((element) => element.slug == tag.slug);
        } else {
          return false;
        }
      },
    );

    return InkWell(
      onTap: () {
        context.read<TaskDetailBloc>().add(IsSelectedTagEvent(tag: tag));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.iconIcFilledTag,
                    colorFilter: ColorFilter.mode(getColor, BlendMode.srcIn),
                    height: 21,
                    width: 21,
                  ),
                  16.width,
                  Text(tag.name.validate()),
                ],
              ),
            ),
            if (isTagAlreadySelected) Icon(Icons.check, color: getColor)
          ],
        ),
      ),
    );
  }
}
