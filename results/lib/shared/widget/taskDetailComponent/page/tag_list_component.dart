import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TagListComponent extends HookWidget {
  /// Doc Required
  const TagListComponent({
    required final ManageTodoPageParam localTodoData,
    super.key,
  }) : _localTodoData = localTodoData;

  final ManageTodoPageParam _localTodoData;

  UtilityService get _utilityService => getIt<UtilityService>();

  void _onTagRemoveTap(final BuildContext context, final TagEntity data) {
    context.read<TaskDetailBloc>().add(RemoveTagFromListEvent(tag: data));
  }

  @override
  Widget build(final BuildContext context) {
    final List<TagEntity> list =
        context.select((final TaskDetailBloc taskDetailBloc) {
      final TaskDetailState state = taskDetailBloc.state;
      return state is TaskDetailDataState
          ? state.selectedTagList
          : <TagEntity>[];
    });
    _localTodoData.tags = list;

    if (list.isEmpty) {
      return const Offstage();
    }

    return Wrap(
      children: list.map(
        (final TagEntity data) {
          final Color tagColor =
              _utilityService.stringToColor(data.color.validate());

          return Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _utilityService.stringToColor(data.color.validate()),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                4.width,
                Text(
                  '#${data.name.validate()} ',
                  style: boldTextStyle(size: 10, color: tagColor),
                ),
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
