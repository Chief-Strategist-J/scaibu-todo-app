import 'package:todo_app/core/app_library.dart';

/// Doc Required

class TaskDetailSelectionUtil {
  static List<T> _toggleSelection<T>(final List<T> currentList, final T item) {
    final List<T> list = List<T>.from(currentList);
    (list.contains(item)) ? list.remove(item) : list.add(item);
    return list;
  }

  /// Doc Required
  static List<TagEntity> modifyTagList(
    final List<TagEntity> currentList,
    final TagEntity tag, {
    required final bool addTag,
  }) {
    final List<TagEntity> list = List<TagEntity>.from(currentList);
    addTag
        ? list.add(tag)
        : list
            .removeWhere((final TagEntity element) => element.slug == tag.slug);
    return list;
  }

  /// Doc Required
  static List<ProjectEntity> toggleProjectSelection(
    final List<ProjectEntity> currentList,
    final ProjectEntity project,
  ) =>
      _toggleSelection(currentList, project);

  /// Doc Required
  static List<TagEntity> toggleTagSelection(
    final List<TagEntity> currentList,
    final TagEntity tag,
  ) =>
      _toggleSelection(currentList, tag);
}
