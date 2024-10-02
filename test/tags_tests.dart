import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/app_library.dart';

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
    getIt.reset();

    // Register mocks
    mockGetAllSeededTagsUseCase = MockGetAllSeededTagsUseCase();
    mockHelperTagRepository = MockHelperTagRepository();
    mockRestApi = MockRestApi();

    // Register the RestApi
    getIt.registerSingleton<RestApi>(mockRestApi);

    // Register the HelperTagRepository
    getIt.registerSingleton<HelperTagRepository<TagEntity>>(
      mockHelperTagRepository,
      instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper,
    );

    // Register the GetAllSeededTagsUseCase
    getIt.registerSingleton<GetAllSeededTagsUseCase>(
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

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits [TaskDetailDataState] with updated selectedTagList when IsSelectedTagEvent is added',
      build: () {
        return taskDetailBloc
          ..emit(
            TaskDetailDataState(
              selectedTagList: const [
                TagEntity(slug: 'tag1'),
              ],
            ),
          );
      },
      act: (bloc) => bloc.add(
        IsSelectedTagEvent(
          tag: const TagEntity(slug: 'tag2'),
        ),
      ),
      expect: () => [
        TaskDetailDataState(
          selectedTagList: const [
            TagEntity(slug: 'tag1'),
            TagEntity(slug: 'tag2'),
          ],
        ),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'removes tag from selectedTagList if it already exists',
      build: () {
        return taskDetailBloc
          ..emit(
            TaskDetailDataState(
              selectedTagList: const [
                TagEntity(slug: 'tag1'),
                TagEntity(slug: 'tag2'),
              ],
            ),
          );
      },
      act: (bloc) => bloc.add(
        IsSelectedTagEvent(tag: const TagEntity(slug: 'tag2')),
      ),
      expect: () => [
        TaskDetailDataState(
          selectedTagList: const [
            TagEntity(slug: 'tag1'),
          ],
        ),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits updated selectedTagList when RemoveTagFromListEvent is added',
      build: () {
        const tagToRemove = TagEntity(slug: 'tag1');
        return TaskDetailBloc()
          ..emit(
            TaskDetailDataState(
              selectedTagList: const [tagToRemove, TagEntity(slug: 'tag2')],
            ),
          );
      },
      act: (bloc) => bloc.add(RemoveTagFromListEvent(tag: const TagEntity(slug: 'tag1'))),
      expect: () {
        return [
          isA<TaskDetailDataState>().having((state) => state.selectedTagList, 'selectedTagList', [const TagEntity(slug: 'tag2')]),
        ];
      },
    );
  });
}
