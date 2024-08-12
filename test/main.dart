import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/domain/useCases/get_all_seeded_tags_use_case.dart';

class MockGetAllSeededTagsUseCase extends Mock implements GetAllSeededTagsUseCase {}

class MockHelperTagRepository extends Mock implements HelperTagRepository<TagEntity> {}

class MockRestApi extends Mock implements RestApi {}

void main() {
  late TaskDetailBloc taskDetailBloc;
  late MockGetAllSeededTagsUseCase mockGetAllSeededTagsUseCase;
  late MockHelperTagRepository mockHelperTagRepository;
  late MockRestApi mockRestApi;

  setUp(() {
    // Clear the previous registrations
    GetIt.I.reset();

    // Register mocks
    mockGetAllSeededTagsUseCase = MockGetAllSeededTagsUseCase();
    mockHelperTagRepository = MockHelperTagRepository();
    mockRestApi = MockRestApi();

    // Register the RestApi
    GetIt.I.registerSingleton<RestApi>(mockRestApi);

    // Register the HelperTagRepository
    GetIt.I.registerSingleton<HelperTagRepository<TagEntity>>(
      mockHelperTagRepository,
      instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper,
    );

    // Register the GetAllSeededTagsUseCase
    GetIt.I.registerSingleton<GetAllSeededTagsUseCase>(
      mockGetAllSeededTagsUseCase,
      instanceName: TagsDependencyInjection.getAllSeededTagsUseCase,
    );

    // Create the bloc
    taskDetailBloc = TaskDetailBloc(); // Ensure it gets the injected dependencies
  });

  tearDown(() {
    taskDetailBloc.close();
  });

  group('TaskDetailBloc', () {
    test('initial state is TaskDetailInitState', () {
      expect(taskDetailBloc.state, TaskDetailInitState());
    });

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits updated pomodoroCont when UpdatePomodoroCounterEvent is added',
      build: () => taskDetailBloc,
      act: (bloc) => bloc.add(
        UpdatePomodoroCounterEvent(count: 5),
      ),
      expect: () => [
        isA<TaskDetailDataState>().having((state) => state.pomodoroCont, 'pomodoroCont', 5),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits updated priority when UpdatePriorityEvent is added',
      build: () => taskDetailBloc,
      act: (bloc) => bloc.add(
        UpdatePriorityEvent(
          priority: PriorityModel(
            title: 'High Priority',
            code: 'high_priority',
            color: Colors.red,
          ),
        ),
      ),
      expect: () => [
        isA<TaskDetailDataState>().having((state) => state.priority?.title, 'priority title', 'High Priority'),
      ],
    );
  });
}
