import 'package:todo_app/core/app_library.dart';

class CreateProjectComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam localTodoData;

  const CreateProjectComponent({
    required TaskDetailComponentVariantStyle style,
    required this.localTodoData,
    super.key,
  }) : _style = style;

  List<ProjectEntity> _projectList(BuildContext context) {
    return context.select((TaskDetailBloc value) {
      final state = value.state;
      if (state is TaskDetailDataState) {
        localTodoData.project = state.selectedProjectList;
        return state.projectList;
      } else {
        return [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ProjectEntity> _list = _projectList(context);

    if(_list.isEmpty) return const Offstage();

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
                  Text("Projects", style: boldTextStyle(size: 20)),
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
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(thickness: 0.5),
                itemBuilder: (context, index) {
                  final project = _list[index];
                  return ListItemComponent<ProjectEntity>(
                    item: project,
                    name: project.name.validate(),
                    slug: project.slug.validate(),
                    isTag: false,
                    getColor: () => blackColor,
                    onTap: () {
                      context.read<TaskDetailBloc>().add(IsSelectedProjectEvent(project: project));
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
