import 'package:todo_app/core/app_library.dart';

class TagListComponent extends HookWidget {
  final List<TagEntity> _list;

  const TagListComponent({super.key, required List<TagEntity> list}) : _list = list;

  UtilityService get _utilityService => getIt<UtilityService>();

  void _onTagRemoveTap(BuildContext context, TagEntity data) {
    context.read<TaskDetailBloc>().add(RemoveTagFromListEvent(tag: data));
  }

  @override
  Widget build(BuildContext context) {
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
