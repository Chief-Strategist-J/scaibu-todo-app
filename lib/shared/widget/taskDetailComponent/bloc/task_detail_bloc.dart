import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/domain/useCases/get_tags_by_todo_id_use_case.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  bool isSeededTagsRetrieved = false;

  TaskDetailBloc() : super(TaskDetailInitState()) {
    on<InitTaskDetailEvent>(_init);
    on<UpdatePomodoroCounterEvent>(_updatePomodoro);
    on<UpdatePriorityEvent>(_updatePriority);
    on<IsSelectedTagEvent>(_isTagIsSelected);
    on<RemoveTagFromListEvent>(_removeTagFromList);
    on<AddTagInListEvent>(_addTagInList);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _init(InitTaskDetailEvent event, Emitter<TaskDetailState> emit) async {
    if (!isSeededTagsRetrieved) {
      isSeededTagsRetrieved = true;
      await _getSeededTags(emit);
    } else {
      _emitDataState(emit, pomodoroCont: 0);
    }

    if (event.todoId != null) {
      _getTagsFromIfTagsList(event);
    }
  }

  Future<void> _getSeededTags(Emitter<TaskDetailState> emit) async {
    final result = await getIt<GetAllSeededTagsUseCase>(instanceName: TagsDependencyInjection.getAllSeededTagsUseCase)(NoParams());

    result.fold((failure) {
      if (failure is ServerFailure) debugPrint('Error: ${failure.errorMessage}');
    }, (tags) {
      _emitDataState(emit, tagList: tags, pomodoroCont: 0);
    });
  }

  Future<void> _getTagsFromIfTagsList(InitTaskDetailEvent event) async {
    final tags = await getIt<GetTagsByTodoIdUseCase>(instanceName: TagsDependencyInjection.getTagsByTodoIdUseCase)(event.todoId.toString());

    tags.fold((failure) {
      if (failure is ServerFailure) debugPrint('Error: ${failure.errorMessage}');
    }, (tagList) {
      if (tagList.isNotEmpty) {
        for (TagEntity tag in tagList) {
          add(AddTagInListEvent(tag: tag));
        }
      }
    });
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

  void _addTagInList(AddTagInListEvent event, Emitter<TaskDetailState> emit) async {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;
      final list = List<TagEntity>.from(currentState.selectedTagList);
      list.add(event.tag);
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
