import 'package:todo_app/core/app_library.dart';

/// A BLoC (Business Logic Component) that handles events related
/// to task details
/// and manages the corresponding state updates.
class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  /// Initializes the [TaskDetailBloc] with the initial state.
  TaskDetailBloc() : super(TaskDetailInitState()) {
    on<InitTaskDetailEvent>(_init);
    on<UpdatePriorityEvent>(_handleStateUpdateEvent);
    on<IsSelectedTagEvent>(_toggleTagSelection);
    on<IsSelectedProjectEvent>(_toggleProjectSelection);
    on<RemoveTagFromListEvent>(_removeTagFromList);
    on<AddTagInListEvent>(_addTagToList);
    on<UpdatePomodoroCounterEvent>(_handleStateUpdateEvent);
    on<UpdatePomodoroDurationEvent>(_handleStateUpdateEvent);
  }

  bool _isSeededTagsRetrieved = false;

  final TaskDetailApiService _tagApiService = TaskDetailApiService();

  Future<void> _init(
    final InitTaskDetailEvent event,
    final Emitter<TaskDetailState> emit,
  ) async {
    if (!_isSeededTagsRetrieved) {
      _isSeededTagsRetrieved = true;
      await _getData(emit);
    } else {
      _emitDataState(emit, pomodoroCont: 0);
    }
    await _getTagsForTodoList(event);
  }

  Future<void> _getData(final Emitter<TaskDetailState> emit) async {
    try {
      final List<TagEntity> combinedTags = await _tagApiService
          .fetchSeededTags(userCredentials.getUserId.toString());

      _emitDataState(emit, tagList: combinedTags, pomodoroCont: 0);
    } catch (e) {
      debugPrint('Unexpected error: $e');
    }
  }

  Future<void> _getTagsForTodoList(final InitTaskDetailEvent event) async {
    if (event.todoPageData.todoId == null) {
      return;
    }

    final List<TagEntity> tagList =
        await _tagApiService.fetchTagsForTodoId(event.todoPageData.todoId!);
    if (tagList.isNotEmpty) {
      for (final TagEntity tag in tagList) {
        add(AddTagInListEvent(tag: tag));
      }
    }
  }

  Future<void> _handleStateUpdateEvent(
    final dynamic event,
    final Emitter<TaskDetailState> emit,
  ) async {
    if (event is UpdatePomodoroCounterEvent) {
      _emitDataState(emit, pomodoroCont: event.count);
    } else if (event is UpdatePomodoroDurationEvent) {
      _emitDataState(emit, pomodoroDuration: event.duration);
    } else if (event is UpdatePriorityEvent) {
      _emitDataState(emit, priority: event.priority);
    }
  }

  void _toggleTagSelection(
    final IsSelectedTagEvent event,
    final Emitter<TaskDetailState> emit,
  ) {
    final List<TagEntity> updatedList =
        TaskDetailSelectionUtil.toggleTagSelection(
      (state as TaskDetailDataState).selectedTagList,
      event.tag,
    );
    _emitDataState(emit, selectedTagList: updatedList);
  }

  void _toggleProjectSelection(
    final IsSelectedProjectEvent event,
    final Emitter<TaskDetailState> emit,
  ) {
    final List<ProjectEntity> updatedList =
        TaskDetailSelectionUtil.toggleProjectSelection(
      (state as TaskDetailDataState).selectedProjectList,
      event.project,
    );
    _emitDataState(emit, selectedProjectList: updatedList);
  }

  void _removeTagFromList(
    final RemoveTagFromListEvent event,
    final Emitter<TaskDetailState> emit,
  ) {
    final List<TagEntity> updatedList = TaskDetailSelectionUtil.modifyTagList(
      (state as TaskDetailDataState).selectedTagList,
      event.tag,
      addTag: false,
    );
    _emitDataState(emit, selectedTagList: updatedList);
  }

  void _addTagToList(
    final AddTagInListEvent event,
    final Emitter<TaskDetailState> emit,
  ) {
    final List<TagEntity> updatedList = TaskDetailSelectionUtil.modifyTagList(
      (state as TaskDetailDataState).selectedTagList,
      event.tag,
      addTag: true,
    );
    _emitDataState(emit, selectedTagList: updatedList);
  }

  void _emitDataState(
    final Emitter<TaskDetailState> emit, {
    final int? pomodoroCont,
    final int? pomodoroDuration,
    final PriorityModel? priority,
    final List<TagEntity>? tagList,
    final List<TagEntity>? selectedTagList,
    final List<ProjectEntity>? projectList,
    final List<ProjectEntity>? selectedProjectList,
  }) {
    if (state is TaskDetailDataState) {
      final TaskDetailDataState currentState = state as TaskDetailDataState;

      emit(
        currentState.copyWith(
          tagList: tagList ?? currentState.tagList,
          pomodoroCont: pomodoroCont ?? currentState.pomodoroCont,
          priority: priority ?? currentState.priority,
          selectedTagList: selectedTagList ?? currentState.selectedTagList,
          pomodoroDuration: pomodoroDuration ?? currentState.pomodoroDuration,
          selectedProjectList:
              selectedProjectList ?? currentState.selectedProjectList,
          projectList: projectList ?? currentState.projectList,
        ),
      );
    } else {
      emit(
        TaskDetailDataState(
          tagList: tagList ?? <TagEntity>[],
          projectList: projectList ?? <ProjectEntity>[],
          pomodoroCont: pomodoroCont ?? 0,
          pomodoroDuration: pomodoroDuration ?? 0,
          priority: priority,
          selectedTagList: selectedTagList ?? <TagEntity>[],
          selectedProjectList: selectedProjectList ?? <ProjectEntity>[],
        ),
      );
    }
  }
}
