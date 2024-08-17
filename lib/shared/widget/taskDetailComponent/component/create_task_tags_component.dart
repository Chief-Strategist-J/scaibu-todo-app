import 'package:todo_app/core/app_library.dart';

class CreateTaskTagsComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam localTodoData;

  const CreateTaskTagsComponent({
    required TaskDetailComponentVariantStyle style,
    required this.localTodoData,
    super.key,
  }) : _style = style;

  @override
  Widget build(BuildContext context) {
    final List<TagEntity> _list = context.select((TaskDetailBloc value) {
      final state = value.state;
      if (state is TaskDetailDataState) {
        localTodoData.tags = state.selectedTagList;
        return state.tagList;
      } else {
        return [];
      }
    });

    return PressableBox(
      style: _style.dialogStyle(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Offstage(),
              Text("Tags", style: boldTextStyle(size: 20)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  //
                },
              )
            ],
          ),
          ListView.separated(
            itemCount: _list.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(thickness: 0.5),
            itemBuilder: (context, index) {
              final tag = _list[index];
              return TagListItemComponent(tag);
            },
          ),
          16.height,
        ],
      ),
    );
  }
}
