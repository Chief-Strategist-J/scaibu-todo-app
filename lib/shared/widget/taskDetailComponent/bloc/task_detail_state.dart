import 'package:todo_app/core/app_library.dart';

sealed class TaskDetailState extends Equatable {}

class TaskDetailInitState extends TaskDetailState {
  @override
  List<Object?> get props => [];
}

class TaskDetailDataState extends TaskDetailState {
  final int? _pomodoroCont;
  final PriorityModel? _priority;
  final List<TagEntity> _tagList;
  final List<TagEntity> _selectedTagList;

  @override
  List<Object?> get props {
    return [
      _pomodoroCont,
      _priority,
      _tagList,
      _selectedTagList,
    ];
  }

  TaskDetailDataState({
    int? pomodoroCont,
    PriorityModel? priority,
    List<TagEntity> tagList = const [],
    List<TagEntity> selectedTagList = const [],
  })  : _tagList = tagList,
        _priority = priority,
        _pomodoroCont = pomodoroCont,
        _selectedTagList = selectedTagList;

  PriorityModel? get priority => _priority;

  int? get pomodoroCont => _pomodoroCont;

  List<TagEntity> get tagList => _tagList;

  List<TagEntity> get selectedTagList => _selectedTagList;

  TaskDetailDataState copyWith({
    int? pomodoroCont,
    PriorityModel? priority,
    List<TagEntity>? tagList,
    List<TagEntity>? selectedTagList,
  }) {
    return TaskDetailDataState(
      pomodoroCont: pomodoroCont ?? this.pomodoroCont,
      priority: priority ?? this.priority,
      tagList: tagList ?? this.tagList,
      selectedTagList: selectedTagList ?? this.selectedTagList,
    );
  }
}
