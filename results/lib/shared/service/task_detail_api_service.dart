import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TaskDetailApiService {
  /// Doc Required
  TaskDetailApiService()
      : _getAllSeededTags = getIt<GetAllSeededTagsUseCase>(
          instanceName: TagsDependencyInjection.getAllSeededTagsUseCase,
        ),
        _getAllTagsByUserId = getIt<GetAllTagsByUserIdUseCase>(
          instanceName: TagsDependencyInjection.getAllTagsByUserIdUseCase,
        ),
        _getTagsByTodoId = getIt<GetTagsByTodoIdUseCase>(
          instanceName: TagsDependencyInjection.getTagsByTodoIdUseCase,
        );

  final GetAllSeededTagsUseCase _getAllSeededTags;
  final GetAllTagsByUserIdUseCase _getAllTagsByUserId;
  final GetTagsByTodoIdUseCase _getTagsByTodoId;

  List<TagEntity> _handleTagResult(
    final Either<Failure, List<TagEntity>> result,
  ) =>
      result.fold(
        (final Failure failure) => <TagEntity>[],
        (final List<TagEntity> tags) => tags,
      );

  /// Doc Required
  Future<List<TagEntity>> fetchTagsForTodoId(final String todoId) async {
    final Either<Failure, List<TagEntity>> result =
        await _getTagsByTodoId(todoId);

    return result.fold(
      (final Failure failure) {
        if (failure is ServerFailure) {
          debugPrint('Error: ${failure.errorMessage}');
        }
        return <TagEntity>[];
      },
      (final List<TagEntity> tagList) => tagList,
    );
  }

  /// Doc Required
  Future<List<TagEntity>> fetchSeededTags(final String userId) async {
    final Map<String, Object> req = <String, Object>{
      'page': 1,
      'limit': 50,
      'userId': userId,
    };

    final List<List<TagEntity>> results =
        await Future.wait(<Future<List<TagEntity>>>[
      _getAllSeededTags(NoParams()).then(_handleTagResult),
      _getAllTagsByUserId(req).then(_handleTagResult),
    ]);

    return <TagEntity>[...results[0], ...results[1]];
  }
}
