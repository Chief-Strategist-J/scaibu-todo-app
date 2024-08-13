import 'package:todo_app/core/app_library.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  bool isSeededTagsRetrieved = false;

  TaskDetailBloc() : super(TaskDetailInitState()) {
    on<InitTaskDetailEvent>(_init);
    on<UpdatePomodoroCounterEvent>(_updatePomodoro);
    on<UpdatePriorityEvent>(_updatePriority);
    on<IsSelectedTagEvent>(_isTagIsSelected);
    on<RemoveTagFromListEvent>(_removeTagFromList);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _init(InitTaskDetailEvent event, Emitter<TaskDetailState> emit) async {
    if (!isSeededTagsRetrieved) {
      isSeededTagsRetrieved = true;
      final getAllSeededTagsUseCase = getIt<GetAllSeededTagsUseCase>(instanceName: TagsDependencyInjection.getAllSeededTagsUseCase);
      final result = await getAllSeededTagsUseCase(NoParams());

      result.fold((failure) {
        if (failure is ServerFailure) debugPrint('Error: ${failure.errorMessage}');
      }, (tags) {
        _emitDataState(emit, tagList: tags, pomodoroCont: 0);
      });
    } else {
      _emitDataState(emit, pomodoroCont: 0);
    }
  }

  void _updatePomodoro(UpdatePomodoroCounterEvent event, Emitter<TaskDetailState> emit) async {
    _emitDataState(emit, pomodoroCont: event.count);
  }

  void _updatePriority(UpdatePriorityEvent event, Emitter<TaskDetailState> emit) async {
    _emitDataState(emit, priority: event.priority);
  }

  void _isTagIsSelected(IsSelectedTagEvent event, Emitter<TaskDetailState> emit) async {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;
      final list = List<TagEntity>.from(currentState.selectedTagList);

      (list.any((element) => element.slug == event.tag.slug)) ? list.remove(event.tag) : list.add(event.tag);
      _emitDataState(emit, selectedTagList: list);
    }
  }

  void _removeTagFromList(RemoveTagFromListEvent event, Emitter<TaskDetailState> emit) async {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;
      final list = List<TagEntity>.from(currentState.selectedTagList);
      if (list.any((element) => element.slug == event.tag.slug)) list.remove(event.tag);
      _emitDataState(emit, selectedTagList: list);
    }
  }

  void _emitDataState(
    Emitter<TaskDetailState> emit, {
    List<TagEntity>? tagList,
    int? pomodoroCont,
    PriorityModel? priority,
    List<TagEntity>? selectedTagList,
  }) {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;
      emit(
        currentState.copyWith(
          tagList: tagList ?? currentState.tagList,
          pomodoroCont: pomodoroCont ?? currentState.pomodoroCont,
          priority: priority ?? currentState.priority,
          selectedTagList: selectedTagList ?? currentState.selectedTagList,
        ),
      );
    } else {
      emit(TaskDetailDataState(
        tagList: tagList ?? [],
        pomodoroCont: pomodoroCont ?? 0,
        priority: priority,
        selectedTagList: selectedTagList ?? [],
      ));
    }
  }
}
