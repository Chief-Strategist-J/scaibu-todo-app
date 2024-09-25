import 'package:todo_app/core/app_library.dart';

class EmptyEntityModel<T> {
  final TaskDetailComponentVariantStyle style;
  final ManageTodoPageParam data;
  final bool isTag;
  final String title;
  final String emptyMessage;
  final String button;
  final VoidCallback onCreateTap;
  final void Function(BuildContext context, T entity) onTap;

  EmptyEntityModel({
    required this.style,
    required this.data,
    required this.title,
    required this.emptyMessage,
    required this.button,
    required this.onCreateTap,
    required this.onTap,
    required this.isTag,
  });

  R _getEntityProperty<R>({
    required R Function() forTag,
    required R Function() forProject,
    required R defaultValue,
  }) {
    if (T == TagEntity) {
      return forTag();
    } else if (T == ProjectEntity) {
      return forProject();
    }
    return defaultValue;
  }

  static Widget _createEntityComponent<T>(EmptyEntityModel<T> model) {
    return CreateEntityComponent<T>(
      model: model,
      listItemBuilder: (context, entity) {
        return ListItemComponent<T>(entity: entity, emptyEntity: model);
      },
    );
  }

  static Widget _getEntityWidget<T>({
    required TaskDetailComponentVariantStyle style,
    required BuildContext ctx,
    required ManageTodoPageParam data,
    required bool isTag,
    required String title,
    required String buttonText,
    required String emptyMsg,
    required VoidCallback onCreateTap,
    required void Function(BuildContext, T) onTap,
  }) {
    final entityModel = EmptyEntityModel<T>(
      style: style,
      isTag: isTag,
      title: title,
      button: buttonText,
      emptyMessage: emptyMsg,
      data: data,
      onCreateTap: onCreateTap,
      onTap: onTap,
    );

    return _createEntityComponent<T>(entityModel);
  }

  List<T> getList(BuildContext context) {
    return _getEntityProperty(
      forTag: () => EntityUtils.fetchTags(context, data) as List<T>,
      forProject: () => EntityUtils.fetchProjects(context, data) as List<T>,
      defaultValue: <T>[],
    );
  }

  static Widget getTagComponent(TaskDetailComponentVariantStyle style, BuildContext ctx, ManageTodoPageParam data) {
    return _getEntityWidget<TagEntity>(
      style: style,
      ctx: ctx,
      data: data,
      isTag: true,
      title: "Tags",
      buttonText: 'Create Tag',
      emptyMsg: "Looks Like There Are No Tags Yet\n Would You Like To Create One?",
      onCreateTap: () {
        ctx.push(ApplicationPaths.createTagPage);
      },
      onTap: (context, tag) {
        context.read<TaskDetailBloc>().add(IsSelectedTagEvent(tag: tag));
      },
    );
  }

  static Widget getProjectComponent(TaskDetailComponentVariantStyle style, BuildContext ctx, ManageTodoPageParam data) {
    return _getEntityWidget<ProjectEntity>(
      style: style,
      ctx: ctx,
      data: data,
      isTag: false,
      title: "Projects",
      buttonText: 'Create Project',
      emptyMsg: "Looks Like There Are No Projects Yet\n Would You Like To Create One?",
      onCreateTap: () {
        ctx.push(ApplicationPaths.projectPage);
      },
      onTap: (context, project) {
        context.read<TaskDetailBloc>().add(IsSelectedProjectEvent(project: project));
      },
    );
  }
}
