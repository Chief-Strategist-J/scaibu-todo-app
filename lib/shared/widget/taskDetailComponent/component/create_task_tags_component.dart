import 'package:todo_app/core/app_library.dart';

class CreateTaskTagsComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam localTodoData;

  const CreateTaskTagsComponent({
    required TaskDetailComponentVariantStyle style,
    required this.localTodoData,
    super.key,
  }) : _style = style;

  void _onTapOfCreateTag(BuildContext context) {
    context.push(ApplicationPaths.createTagPage);
  }

  List<TagEntity> _tagList(BuildContext context) {
    return context.select((TaskDetailBloc value) {
      final state = value.state;
      if (state is TaskDetailDataState) {
        localTodoData.tags = state.selectedTagList;
        return state.tagList;
      } else {
        return [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TagEntity> _list = _tagList(context);

    return PressableBox(
      style: _style.dialogStyle(context),
      child: AnimatedScrollView(
        children: [
          Column(
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
                      _onTapOfCreateTag(context);
                    },
                  )
                ],
              ),
              ListView.separated(
                itemCount: _list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(thickness: 0.5),
                itemBuilder: (context, index) {
                  final tag = _list[index];
                  return ListItemComponent<TagEntity>(
                    item: tag,
                    name: tag.name.validate(),
                    slug: tag.slug.validate(),
                    isTag: true,
                    getColor: () => getIt<UtilityService>().stringToColor(tag.color ?? '0xFFFFEBEE'),
                    onTap: () {
                      context.read<TaskDetailBloc>().add(IsSelectedTagEvent(tag: tag));
                    },
                  );
                },
              ),
              16.height,
            ],
          ),
        ],
      ),
    );
  }
}
