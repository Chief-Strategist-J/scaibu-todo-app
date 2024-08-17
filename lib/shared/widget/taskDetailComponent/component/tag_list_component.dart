import 'package:todo_app/core/app_library.dart';

class TagListComponent extends HookWidget {
  final ManageTodoPageParam localTodoData;
  const TagListComponent({required this.localTodoData,super.key});

  UtilityService get _utilityService => getIt<UtilityService>();

  void _onTagRemoveTap(BuildContext context, TagEntity data) {
    context.read<TaskDetailBloc>().add(RemoveTagFromListEvent(tag: data));
  }

  @override
  Widget build(BuildContext context) {
    final List<TagEntity> _list = context.select((TaskDetailBloc taskDetailBloc) {
      final state = taskDetailBloc.state;
      return state is TaskDetailDataState ? state.selectedTagList : [];
    });
    localTodoData.tags = _list;

    if (_list.isEmpty) return const Offstage();

    return Wrap(
      children: _list.map(
        (data) {
          final Color tagColor = _utilityService.stringToColor(data.color.validate());

          return Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _utilityService.stringToColor(data.color.validate())),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                4.width,
                Text("#${data.name.validate()} ", style: boldTextStyle(size: 10, color: tagColor)),
                2.width,
                InkWell(
                  onTap: () {
                    _onTagRemoveTap(context, data);
                  },
                  child: Icon(Icons.close, color: tagColor, size: 12),
                ),
                2.width,
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
