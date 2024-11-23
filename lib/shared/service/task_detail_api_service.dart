import 'package:todo_app/core/app_library.dart';

class TaskDetailApiService {
  final GetAllSeededTagsUseCase _getAllSeededTags;
  final GetAllTagsByUserIdUseCase _getAllTagsByUserId;
  final GetTagsByTodoIdUseCase _getTagsByTodoId;


  TaskDetailApiService()
      : _getAllSeededTags = getIt<GetAllSeededTagsUseCase>(instanceName: TagsDependencyInjection.getAllSeededTagsUseCase),
        _getAllTagsByUserId = getIt<GetAllTagsByUserIdUseCase>(instanceName: TagsDependencyInjection.getAllTagsByUserIdUseCase),
        _getTagsByTodoId = getIt<GetTagsByTodoIdUseCase>(instanceName: TagsDependencyInjection.getTagsByTodoIdUseCase);

  List<TagEntity> _handleTagResult(Either<Failure, List<TagEntity>> result) {
    return result.fold((failure) => <TagEntity>[], (tags) => tags);
  }

  Future<List<TagEntity>> fetchTagsForTodoId(String todoId) async {
    final result = await _getTagsByTodoId(todoId);

    return result.fold(
      (failure) {
        if (failure is ServerFailure) debugPrint('Error: ${failure.errorMessage}');
        return [];
      },
      (tagList) => tagList,
    );
  }

  Future<List<TagEntity>> fetchSeededTags(String userId) async {
    final req = {"page": 1, "limit": 50, "userId": userId};

    final results = await Future.wait([
      _getAllSeededTags(NoParams()).then(_handleTagResult),
      _getAllTagsByUserId(req).then(_handleTagResult),
    ]);

    return [...results[0], ...results[1]];
  }
}

