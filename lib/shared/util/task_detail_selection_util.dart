import 'package:todo_app/core/app_library.dart';

class TaskDetailSelectionUtil {
  static List<T> _toggleSelection<T>(final List<T> currentList, final T item) {
    final List<T> list = List<T>.from(currentList);
    (list.contains(item)) ? list.remove(item) : list.add(item);
    return list;
  }

  static List<TagEntity> modifyTagList(final List<TagEntity> currentList,
      final TagEntity tag, final bool addTag) {
    final List<TagEntity> list = List<TagEntity>.from(currentList);
    addTag
        ? list.add(tag)
        : list
            .removeWhere((final TagEntity element) => element.slug == tag.slug);
    return list;
  }

  static List<ProjectEntity> toggleProjectSelection(
          final List<ProjectEntity> currentList, final ProjectEntity project) =>
      _toggleSelection(currentList, project);

  static List<TagEntity> toggleTagSelection(
          final List<TagEntity> currentList, final TagEntity tag) =>
      _toggleSelection(currentList, tag);
}
