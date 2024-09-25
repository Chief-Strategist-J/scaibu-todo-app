import 'package:todo_app/core/app_library.dart';

class TaskDetailSelectionUtil {
  static List<T> _toggleSelection<T>(List<T> currentList, T item) {
    final list = List<T>.from(currentList);
    (list.contains(item)) ? list.remove(item) : list.add(item);
    return list;
  }

  static List<TagEntity> modifyTagList(List<TagEntity> currentList, TagEntity tag, bool addTag) {
    final list = List<TagEntity>.from(currentList);
    (addTag) ? list.add(tag) : list.removeWhere((element) => element.slug == tag.slug);
    return list;
  }

  static List<ProjectEntity> toggleProjectSelection(List<ProjectEntity> currentList, ProjectEntity project) {
    return _toggleSelection(currentList, project);
  }

  static List<TagEntity> toggleTagSelection(List<TagEntity> currentList, TagEntity tag) {
    return _toggleSelection(currentList, tag);
  }
}
