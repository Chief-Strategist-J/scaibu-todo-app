import 'package:todo_app/core/app_library.dart';

class EntityUtils {
  static List<TagEntity> fetchTags(
          final BuildContext context, final ManageTodoPageParam data) =>
      _fetchEntityList<TagEntity>(
        context,
        entitySelector: (final TaskDetailDataState state) => state.tagList,
        updateLocalData: (final TaskDetailDataState state) =>
            data.tags = state.selectedTagList,
      );

  static List<ProjectEntity> fetchProjects(
          final BuildContext context, final ManageTodoPageParam data) =>
      _fetchEntityList<ProjectEntity>(
        context,
        entitySelector: (final TaskDetailDataState state) => state.projectList,
        updateLocalData: (final TaskDetailDataState state) =>
            data.project = state.selectedProjectList,
      );

  static List<T> _fetchEntityList<T>(
    final BuildContext context, {
    required final List<T> Function(TaskDetailDataState state) entitySelector,
    required final void Function(TaskDetailDataState state) updateLocalData,
  }) =>
      context.select((final TaskDetailBloc value) {
        final TaskDetailState currentState = value.state;

        if (currentState is TaskDetailDataState) {
          updateLocalData(currentState);
          return entitySelector(currentState);
        }

        return <T>[];
      });
}
