import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/domain/useCases/get_all_seeded_tags_use_case.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  bool isSeededTagsRetrieved = false;

  TaskDetailBloc() : super(TaskDetailInitState()) {
    on<InitTaskDetailEvent>(_init);
    on<UpdatePomodoroCounterEvent>(_updatePomodoro);
    on<UpdatePriorityEvent>(_updatePriority);
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
        toast(tags.length.validate().toString());
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

  void _emitDataState(Emitter<TaskDetailState> emit, {List<TagEntity>? tagList, int? pomodoroCont, PriorityModel? priority}) {
    if (state is TaskDetailDataState) {
      final currentState = state as TaskDetailDataState;
      emit(currentState.copyWith(
        tagList: tagList ?? currentState.tagList,
        pomodoroCont: pomodoroCont ?? currentState.pomodoroCont,
        priority: priority ?? currentState.priority,
      ));
    } else {
      emit(TaskDetailDataState(
        tagList: tagList ?? [],
        pomodoroCont: pomodoroCont ?? 0,
        priority: priority,
      ));
    }
  }
}
