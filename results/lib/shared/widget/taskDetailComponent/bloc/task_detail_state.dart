import 'package:todo_app/core/app_library.dart';

/// A sealed class representing the base state for task details.
/// All task-related states extend this class.
sealed class TaskDetailState extends Equatable {}

/// The initial state of the task details.
class TaskDetailInitState extends TaskDetailState {
  @override
  List<Object?> get props => <Object?>[];
}

/// The state containing task detail data.
class TaskDetailDataState extends TaskDetailState {
  /// Constructor for initializing the state with task detail data.
  TaskDetailDataState({
    final int? pomodoroCont,
    final int? pomodoroDuration,
    final PriorityModel? priority,
    final List<TagEntity> tagList = const <TagEntity>[],
    final List<TagEntity> selectedTagList = const <TagEntity>[],
    final List<ProjectEntity> projectList = const <ProjectEntity>[],
    final List<ProjectEntity> selectedProjectList = const <ProjectEntity>[
      ProjectEntity(name: 'Demo-1', slug: 'demo_1'),
      ProjectEntity(name: 'Demo-2', slug: 'demo_2'),
    ],
  })  : _tagList = tagList,
        _priority = priority,
        _pomodoroCont = pomodoroCont,
        _pomodoroDuration = pomodoroDuration,
        _selectedTagList = selectedTagList,
        _projectList = projectList,
        _selectedProjectList = selectedProjectList;

  /// The current Pomodoro count.
  final int? _pomodoroCont;

  /// The duration of a Pomodoro session.
  final int? _pomodoroDuration;

  /// The priority of the task.
  final PriorityModel? _priority;

  /// The complete list of tags.
  final List<TagEntity> _tagList;

  /// The list of selected tags.
  final List<TagEntity> _selectedTagList;

  /// The complete list of projects.
  final List<ProjectEntity> _projectList;

  /// The list of selected projects.
  final List<ProjectEntity> _selectedProjectList;

  @override
  List<Object?> get props => <Object?>[
        _pomodoroCont,
        _pomodoroDuration,
        _priority,
        _tagList,
        _selectedTagList,
        _projectList,
        _selectedProjectList,
      ];

  /// Getter for the priority of the task.
  PriorityModel? get priority => _priority;

  /// Getter for the Pomodoro count.
  int? get pomodoroCont => _pomodoroCont;

  /// Getter for the Pomodoro duration.
  int? get pomodoroDuration => _pomodoroDuration;

  /// Getter for the complete list of tags.
  List<TagEntity> get tagList => _tagList;

  /// Getter for the list of selected tags.
  List<TagEntity> get selectedTagList => _selectedTagList;

  /// Getter for the complete list of projects.
  List<ProjectEntity> get projectList => _projectList;

  /// Getter for the list of selected projects.
  List<ProjectEntity> get selectedProjectList => _selectedProjectList;

  /// Creates a copy of the current state with updated values.
  /// If a value is not provided, the current state's value is used.
  TaskDetailDataState copyWith({
    final int? pomodoroCont,
    final int? pomodoroDuration,
    final PriorityModel? priority,
    final List<TagEntity>? tagList,
    final List<TagEntity>? selectedTagList,
    final List<ProjectEntity>? projectList,
    final List<ProjectEntity>? selectedProjectList,
  }) =>
      TaskDetailDataState(
        pomodoroCont: pomodoroCont ?? this.pomodoroCont,
        pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
        priority: priority ?? this.priority,
        tagList: tagList ?? this.tagList,
        selectedTagList: selectedTagList ?? this.selectedTagList,
        projectList: projectList ?? this.projectList,
        selectedProjectList: selectedProjectList ?? this.selectedProjectList,
      );
}
