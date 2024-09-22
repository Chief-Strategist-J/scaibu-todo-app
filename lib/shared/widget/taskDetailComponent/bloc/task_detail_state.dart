import 'package:todo_app/core/app_library.dart';

sealed class TaskDetailState extends Equatable {}

class TaskDetailInitState extends TaskDetailState {
  @override
  List<Object?> get props => [];
}

class TaskDetailDataState extends TaskDetailState {
  final int? _pomodoroCont;
  final int? _pomodoroDuration;
  final PriorityModel? _priority;
  final List<TagEntity> _tagList;
  final List<TagEntity> _selectedTagList;
  final List<ProjectEntity> _projectList;
  final List<ProjectEntity> _selectedProjectList;

  @override
  List<Object?> get props {
    return [
      _pomodoroCont,
      _pomodoroDuration,
      _priority,
      _tagList,
      _selectedTagList,
      _projectList,
      _selectedProjectList,
    ];
  }

  TaskDetailDataState({
    int? pomodoroCont,
    int? pomodoroDuration,
    PriorityModel? priority,
    List<TagEntity> tagList = const [],
    List<TagEntity> selectedTagList = const [],
    List<ProjectEntity> projectList = const [],
    List<ProjectEntity> selectedProjectList = const [
      ProjectEntity(name: "Demo-1",slug: 'demo_1'),
      ProjectEntity(name: "Demo-2",slug: 'demo_2')
    ],
  })  : _tagList = tagList,
        _priority = priority,
        _pomodoroCont = pomodoroCont,
        _pomodoroDuration = pomodoroDuration,
        _selectedTagList = selectedTagList,
        _projectList = projectList,
        _selectedProjectList = selectedProjectList;

  PriorityModel? get priority => _priority;

  int? get pomodoroCont => _pomodoroCont;

  int? get pomodoroDuration => _pomodoroDuration;

  List<TagEntity> get tagList => _tagList;

  List<TagEntity> get selectedTagList => _selectedTagList;

  List<ProjectEntity> get projectList => _projectList;

  List<ProjectEntity> get selectedProjectList => _selectedProjectList;

  TaskDetailDataState copyWith({
    int? pomodoroCont,
    int? pomodoroDuration,
    PriorityModel? priority,
    List<TagEntity>? tagList,
    List<TagEntity>? selectedTagList,
    List<ProjectEntity>? projectList,
    List<ProjectEntity>? selectedProjectList,
  }) {
    return TaskDetailDataState(
      pomodoroCont: pomodoroCont ?? this.pomodoroCont,
      pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
      priority: priority ?? this.priority,
      tagList: tagList ?? this.tagList,
      selectedTagList: selectedTagList ?? this.selectedTagList,
      projectList: projectList ?? this.projectList,
      selectedProjectList: selectedProjectList ?? this.selectedProjectList,
    );
  }
}
