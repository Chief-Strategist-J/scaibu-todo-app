import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/domain/useCases/get_all_tags_by_user_id_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/get_tags_by_todo_id_use_case.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  bool isSeededTagsRetrieved = false;

  TaskDetailBloc() : super(TaskDetailInitState()) {
    on<InitTaskDetailEvent>(_init);
    on<UpdatePriorityEvent>(_updatePriority);
    on<IsSelectedTagEvent>(_isTagIsSelected);
    on<IsSelectedProjectEvent>(_isProjectIsSelected);
    on<RemoveTagFromListEvent>(_removeTagFromList);
    on<AddTagInListEvent>(_addTagInList);
    on<UpdatePomodoroCounterEvent>(_updatePomodoroCounter);
    on<UpdatePomodoroDurationEvent>(_updatePomodoroDuration);
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

    _getTagsFromIfTagsList(event);
  }

  Future<void> _getSeededTags(Emitter<TaskDetailState> emit) async {
    try {
      final getAllSeededTags = getIt<GetAllSeededTagsUseCase>(instanceName: TagsDependencyInjection.getAllSeededTagsUseCase);
      final getAllTagsByUserId = getIt<GetAllTagsByUserIdUseCase>(instanceName: TagsDependencyInjection.getAllTagsByUserIdUseCase);

      final req = {
        "page": 1,
        "limit": 50,
        "userId": userCredentials.getUserId,
      };

      final results = await Future.wait([
        getAllSeededTags(NoParams()).then(
          (result) => result.fold(
            (failure) => <TagEntity>[],
            (tags) => tags,
          ),
        ),
        getAllTagsByUserId(req).then(
          (result) => result.fold(
            (failure) => <TagEntity>[],
            (tags) => tags,
          ),
        ),
      ]);

      final seededTags = results[0];
      final userTags = results[1];

      final combinedTags = [...seededTags, ...userTags];

      _emitDataState(emit, tagList: combinedTags, pomodoroCont: 0);
    } catch (e) {
      debugPrint('Unexpected error: $e');
    }
  }

  Future<void> _getTagsFromIfTagsList(InitTaskDetailEvent event) async {
    if (event.todoPageData.todoId == null) return;

    final getTagsByTodoIdUseCase = getIt<GetTagsByTodoIdUseCase>(instanceName: TagsDependencyInjection.getTagsByTodoIdUseCase);
    final tags = await getTagsByTodoIdUseCase(event.todoPageData.todoId!);

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

  void _updatePomodoroCounter(UpdatePomodoroCounterEvent event, Emitter<TaskDetailState> emit) async {
    _emitDataState(emit, pomodoroCont: event.count);
  }

  void _updatePomodoroDuration(UpdatePomodoroDurationEvent event, Emitter<TaskDetailState> emit) async {
    _emitDataState(emit, pomodoroDuration: event.duration);
  }

  void _updatePriority(UpdatePriorityEvent event, Emitter<TaskDetailState> emit) async {
    _emitDataState(emit, priority: event.priority);
  }

  void _isTagIsSelected(IsSelectedTagEvent event, Emitter<TaskDetailState> emit) async {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;
      final list = List<TagEntity>.from(currentState.selectedTagList);

      (list.any((element) => element.slug == event.tag.slug)) ? list.removeWhere((element) => element.slug == event.tag.slug) : list.add(event.tag);
      _emitDataState(emit, selectedTagList: list);
    }
  }

  void _isProjectIsSelected(IsSelectedProjectEvent event, Emitter<TaskDetailState> emit) async {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;
      final list = List<ProjectEntity>.from(currentState.selectedProjectList);

      (list.any((element) => element.slug == event.project.slug)) ? list.removeWhere((element) => element.slug == event.project.slug) : list.add(event.project);
      _emitDataState(emit, selectedProjectList: list);
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
        selectedProjectList: projectList ?? [
          ProjectEntity(name: "Demo-1",slug: 'demo_1'),
          ProjectEntity(name: "Demo-2",slug: 'demo_2')
        ]
      ));
    }
  }
}
