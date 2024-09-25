import 'package:todo_app/core/app_library.dart';

class EntityUtils {
  static List<TagEntity> fetchTags(BuildContext context, ManageTodoPageParam data) {
    return _fetchEntityList<TagEntity>(
      context,
      entitySelector: (state) {
        return state.tagList;
      },
      updateLocalData: (state) => data.tags = state.selectedTagList,
    );
  }

  static List<ProjectEntity> fetchProjects(BuildContext context, ManageTodoPageParam data) {
    return _fetchEntityList<ProjectEntity>(
      context,
      entitySelector: (state) => state.projectList,
      updateLocalData: (state) => data.project = state.selectedProjectList,
    );
  }

  static List<T> _fetchEntityList<T>(
    BuildContext context, {
    required List<T> Function(TaskDetailDataState state) entitySelector,
    required void Function(TaskDetailDataState state) updateLocalData,
  }) {
    return context.select((TaskDetailBloc value) {
      final currentState = value.state;

      if (currentState is TaskDetailDataState) {
        print("length ${currentState.tagList.length}");
        updateLocalData(currentState);
        return entitySelector(currentState);
      }
      print("empty");
      return <T>[];
    });
  }
}
