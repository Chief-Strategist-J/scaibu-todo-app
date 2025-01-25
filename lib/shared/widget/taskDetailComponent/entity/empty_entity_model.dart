import 'package:todo_app/core/app_library.dart';

/// Doc Required
class EmptyEntityModel<T> {
  /// Doc Required
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

  /// Doc Required
  final TaskDetailComponentVariantStyle style;

  /// Doc Required
  final ManageTodoPageParam data;

  /// Doc Required
  final bool isTag;

  /// Doc Required
  final String title;

  /// Doc Required
  final String emptyMessage;

  /// Doc Required
  final String button;

  /// Doc Required
  final VoidCallback onCreateTap;

  /// Doc Required
  final void Function(BuildContext context, T entity) onTap;

  R _getEntityProperty<R>({
    required final R Function() forTag,
    required final R Function() forProject,
    required final R defaultValue,
  }) {
    if (T == TagEntity) {
      return forTag();
    } else if (T == ProjectEntity) {
      return forProject();
    }
    return defaultValue;
  }

  static Widget _createEntityComponent<T>(final EmptyEntityModel<T> model) =>
      CreateEntityComponent<T>(
        model: model,
        listItemBuilder: (final BuildContext context, final T entity) =>
            ListItemComponent<T>(entity: entity, emptyEntity: model),
      );

  static Widget _getEntityWidget<T>({
    required final TaskDetailComponentVariantStyle style,
    required final BuildContext ctx,
    required final ManageTodoPageParam data,
    required final bool isTag,
    required final String title,
    required final String buttonText,
    required final String emptyMsg,
    required final VoidCallback onCreateTap,
    required final void Function(BuildContext, T) onTap,
  }) {
    final EmptyEntityModel<T> entityModel = EmptyEntityModel<T>(
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

  /// Doc Required
  List<T> getList(final BuildContext context) => _getEntityProperty(
        forTag: () => EntityUtils.fetchTags(context, data) as List<T>,
        forProject: () => EntityUtils.fetchProjects(context, data) as List<T>,
        defaultValue: <T>[],
      );

  /// Doc Required
  static Widget getTagComponent(
    final TaskDetailComponentVariantStyle style,
    final BuildContext ctx,
    final ManageTodoPageParam data,
  ) =>
      _getEntityWidget<TagEntity>(
        style: style,
        ctx: ctx,
        data: data,
        isTag: true,
        title: 'Tags',
        buttonText: 'Create Tag',
        emptyMsg:
            'Looks Like There Are No Tags Yet\n Would You Like To Create One?',
        onCreateTap: () async {
          await ctx.push(ApplicationPaths.createTagPage);
        },
        onTap: (final BuildContext context, final TagEntity tag) {
          context.read<TaskDetailBloc>().add(IsSelectedTagEvent(tag: tag));
        },
      );

  /// Doc Required
  static Widget getProjectComponent(
    final TaskDetailComponentVariantStyle style,
    final BuildContext ctx,
    final ManageTodoPageParam data,
  ) =>
      _getEntityWidget<ProjectEntity>(
        style: style,
        ctx: ctx,
        data: data,
        isTag: false,
        title: 'Projects',
        buttonText: 'Create Project',
        emptyMsg: 'Looks Like There Are No Projects Yet\n Would You Like '
            'To Create One?',
        onCreateTap: () async {
          await ctx.push(ApplicationPaths.createProjectPage);
        },
        onTap: (final BuildContext context, final ProjectEntity project) {
          context
              .read<TaskDetailBloc>()
              .add(IsSelectedProjectEvent(project: project));
        },
      );
}
