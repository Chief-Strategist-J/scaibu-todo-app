import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/app_library.dart';

class MockGetAllSeededTagsUseCase extends Mock
    implements GetAllSeededTagsUseCase {}

class MockHelperTagRepository extends Mock
    implements HelperTagRepository<TagEntity> {}

class MockRestApi extends Mock implements RestApi {}

void main() {
  late TaskDetailBloc taskDetailBloc;
  late MockGetAllSeededTagsUseCase mockGetAllSeededTagsUseCase;
  late MockHelperTagRepository mockHelperTagRepository;
  late MockRestApi mockRestApi;

  setUp(() async {
    // Clear the previous registrations
    await getIt.reset();

    // Register mocks
    mockGetAllSeededTagsUseCase = MockGetAllSeededTagsUseCase();
    mockHelperTagRepository = MockHelperTagRepository();
    mockRestApi = MockRestApi();

    // Register the RestApi
    getIt
      ..registerSingleton<RestApi>(mockRestApi)

      // Register the HelperTagRepository
      ..registerSingleton<HelperTagRepository<TagEntity>>(
        mockHelperTagRepository,
        instanceName:
            TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper,
      )

      // Register the GetAllSeededTagsUseCase
      ..registerSingleton<GetAllSeededTagsUseCase>(
        mockGetAllSeededTagsUseCase,
        instanceName: TagsDependencyInjection.getAllSeededTagsUseCase,
      );

    // Create the bloc
    taskDetailBloc =
        TaskDetailBloc(); // Ensure it gets the injected dependencies
  });

  tearDown(() async {
    await taskDetailBloc.close();
  });

  group('TaskDetailBloc', () {
    test('initial state is TaskDetailInitState', () {
      expect(taskDetailBloc.state, TaskDetailInitState());
    });

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits updated pomodoroCont when UpdatePomodoroCounterEvent is added',
      build: () => taskDetailBloc,
      act: (final TaskDetailBloc bloc) => bloc.add(
        UpdatePomodoroCounterEvent(count: 5),
      ),
      expect: () => <TypeMatcher<TaskDetailDataState>>[
        isA<TaskDetailDataState>().having(
            (final TaskDetailDataState state) => state.pomodoroCont,
            'pomodoroCont',
            5),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits updated priority when UpdatePriorityEvent is added',
      build: () => taskDetailBloc,
      act: (final TaskDetailBloc bloc) => bloc.add(
        UpdatePriorityEvent(
          priority: PriorityModel(
            title: 'High Priority',
            code: 'high_priority',
            color: Colors.red,
          ),
        ),
      ),
      expect: () => <TypeMatcher<TaskDetailDataState>>[
        isA<TaskDetailDataState>().having(
            (final TaskDetailDataState state) => state.priority?.title,
            'priority title',
            'High Priority'),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits [TaskDetailDataState] with updated selectedTagList when '
      'IsSelectedTagEvent is added',
      build: () => taskDetailBloc
        ..emit(
          TaskDetailDataState(
            selectedTagList: const <TagEntity>[
              TagEntity(slug: 'tag1'),
            ],
          ),
        ),
      act: (final TaskDetailBloc bloc) => bloc.add(
        IsSelectedTagEvent(
          tag: const TagEntity(slug: 'tag2'),
        ),
      ),
      expect: () => <TaskDetailDataState>[
        TaskDetailDataState(
          selectedTagList: const <TagEntity>[
            TagEntity(slug: 'tag1'),
            TagEntity(slug: 'tag2'),
          ],
        ),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'removes tag from selectedTagList if it already exists',
      build: () => taskDetailBloc
        ..emit(
          TaskDetailDataState(
            selectedTagList: const <TagEntity>[
              TagEntity(slug: 'tag1'),
              TagEntity(slug: 'tag2'),
            ],
          ),
        ),
      act: (final TaskDetailBloc bloc) => bloc.add(
        IsSelectedTagEvent(tag: const TagEntity(slug: 'tag2')),
      ),
      expect: () => <TaskDetailDataState>[
        TaskDetailDataState(
          selectedTagList: const <TagEntity>[
            TagEntity(slug: 'tag1'),
          ],
        ),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'emits updated selectedTagList when RemoveTagFromListEvent is added',
      build: () {
        const TagEntity tagToRemove = TagEntity(slug: 'tag1');
        return TaskDetailBloc()
          ..emit(
            TaskDetailDataState(
              selectedTagList: const <TagEntity>[
                tagToRemove,
                TagEntity(slug: 'tag2')
              ],
            ),
          );
      },
      act: (final TaskDetailBloc bloc) =>
          bloc.add(RemoveTagFromListEvent(tag: const TagEntity(slug: 'tag1'))),
      expect: () => <TypeMatcher<TaskDetailDataState>>[
        isA<TaskDetailDataState>().having(
            (final TaskDetailDataState state) => state.selectedTagList,
            'selectedTagList',
            <TagEntity>[const TagEntity(slug: 'tag2')]),
      ],
    );
  });
}
