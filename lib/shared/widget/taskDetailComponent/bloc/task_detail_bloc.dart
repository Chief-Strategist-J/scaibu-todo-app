import 'package:todo_app/core/app_library.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  bool isSeededTagsRetrieved = false;

  final _tagApiService = TaskDetailApiService();

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

  @override
  Future<void> close() async {
    await super.close();
  }

  void _init(InitTaskDetailEvent event, Emitter<TaskDetailState> emit) async {
    if (!isSeededTagsRetrieved) {
      isSeededTagsRetrieved = true;
      await _getData(emit);
    } else {
      _emitDataState(emit, pomodoroCont: 0);
    }
    await _getTagsForTodoList(event);
  }

  Future<void> _getData(Emitter<TaskDetailState> emit) async {
    try {
      final combinedTags = await _tagApiService.fetchSeededTags(userCredentials.getUserId.toString());

      _emitDataState(emit, tagList: combinedTags, pomodoroCont: 0);
    } catch (e) {
      debugPrint('Unexpected error: $e');
    }
  }

  Future<void> _getTagsForTodoList(InitTaskDetailEvent event) async {
    if (event.todoPageData.todoId == null) return;

    final tagList = await _tagApiService.fetchTagsForTodoId(event.todoPageData.todoId!);
    if (tagList.isNotEmpty) {
      for (TagEntity tag in tagList) {
        add(AddTagInListEvent(tag: tag));
      }
    }
  }

  void _handleStateUpdateEvent(dynamic event, Emitter<TaskDetailState> emit) async {
    if (event is UpdatePomodoroCounterEvent) {
      _emitDataState(emit, pomodoroCont: event.count);
    } else if (event is UpdatePomodoroDurationEvent) {
      _emitDataState(emit, pomodoroDuration: event.duration);
    } else if (event is UpdatePriorityEvent) {
      _emitDataState(emit, priority: event.priority);
    }
  }

  void _toggleTagSelection(IsSelectedTagEvent event, Emitter<TaskDetailState> emit) {
    final updatedList = TaskDetailSelectionUtil.toggleTagSelection(
      (state as TaskDetailDataState).selectedTagList,
      event.tag,
    );
    _emitDataState(emit, selectedTagList: updatedList);
  }

  void _toggleProjectSelection(IsSelectedProjectEvent event, Emitter<TaskDetailState> emit) {
    final updatedList = TaskDetailSelectionUtil.toggleProjectSelection(
      (state as TaskDetailDataState).selectedProjectList,
      event.project,
    );
    _emitDataState(emit, selectedProjectList: updatedList);
  }

  void _removeTagFromList(RemoveTagFromListEvent event, Emitter<TaskDetailState> emit) {
    final updatedList = TaskDetailSelectionUtil.modifyTagList(
      (state as TaskDetailDataState).selectedTagList,
      event.tag,
      false,
    );
    _emitDataState(emit, selectedTagList: updatedList);
  }

  void _addTagToList(AddTagInListEvent event, Emitter<TaskDetailState> emit) {
    final updatedList = TaskDetailSelectionUtil.modifyTagList(
      (state as TaskDetailDataState).selectedTagList,
      event.tag,
      true,
    );
    _emitDataState(emit, selectedTagList: updatedList);
  }

  void _emitDataState(
    Emitter<TaskDetailState> emit, {
    int? pomodoroCont,
    int? pomodoroDuration,
    PriorityModel? priority,
    List<TagEntity>? tagList,
    List<TagEntity>? selectedTagList,
    List<ProjectEntity>? projectList,
    List<ProjectEntity>? selectedProjectList,
  }) {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;

      emit(
        currentState.copyWith(
          tagList: tagList ?? currentState.tagList,
          pomodoroCont: pomodoroCont ?? currentState.pomodoroCont,
          priority: priority ?? currentState.priority,
          selectedTagList: selectedTagList ?? currentState.selectedTagList,
          pomodoroDuration: pomodoroDuration ?? currentState.pomodoroDuration,
          selectedProjectList: selectedProjectList ?? currentState.selectedProjectList,
          projectList: projectList ?? currentState.projectList,
        ),
      );
    } else {
      emit(TaskDetailDataState(
        tagList: tagList ?? [],
        projectList: projectList ?? [],
        pomodoroCont: pomodoroCont ?? 0,
        pomodoroDuration: pomodoroDuration ?? 0,
        priority: priority,
        selectedTagList: selectedTagList ?? [],
        selectedProjectList: selectedProjectList ?? [],
      ));
    }
  }
}
