import 'package:todo_app/core/app_library.dart';

class GetProjectCategoryDataUseCase extends UseCase<ProjectCategoryDataModelEntity, NoParams> {
  final ProjectRepository<ProjectEntity> projectRepository;
  static const _hiveBoxName = 'project_category_data_cache';
  static const _hiveKey = 'project_category_data';
  static const _cacheTimeKey = 'cache_time';
  static const _cacheDuration = Duration(days: 7);
  static const _maxRetries = 3;
  static const _retryDelay = Duration(seconds: 5);

  Box? _box;
  final BehaviorSubject<ProjectCategoryDataModelEntity> _dataSubject = BehaviorSubject<ProjectCategoryDataModelEntity>();
  final Completer<void> _initCompleter = Completer<void>();
  bool _isDisposed = false;

  GetProjectCategoryDataUseCase({required this.projectRepository}) {
    _initBox();
  }

  Future<void> _initBox() async {
    if (_box != null) return;

    try {
      _box = await Hive.openBox(_hiveBoxName);
      if (!_initCompleter.isCompleted) {
        _initCompleter.complete();
      }
    } catch (e) {
      if (!_initCompleter.isCompleted) {
        _initCompleter.completeError(e);
      }
      logService.crashLog(errorMessage: 'Failed to initialize Hive box', e: e);
    }
  }

  Future<ProjectCategoryDataModelEntity?> _getCachedData() async {
    if (_isDisposed || _box == null) return null;

    try {
      final cachedData = _box?.get(_hiveKey);
      final cacheTime = _box?.get(_cacheTimeKey);

      if (cachedData != null && cacheTime != null && !_isCacheExpired(DateTime.parse(cacheTime))) {
        return ProjectCategoryDataModelEntity.fromJson(jsonDecode(cachedData as String));
      }
    } catch (e) {
      await _clearCache();
    }
    return null;
  }

  Future<void> _clearCache() async {
    if (_box != null && !_isDisposed) {
      await _box?.deleteAll([_hiveKey, _cacheTimeKey]);
    }
  }

  Future<ProjectCategoryDataModelEntity> _fetchDataWithRetry() async {
    Exception? lastError;

    for (int i = 0; i < _maxRetries; i++) {
      try {
        final result = await projectRepository.getProjectCategoryData();
        return result;
      } catch (e) {
        lastError = e is Exception ? e : Exception(e.toString());
        if (i == _maxRetries - 1) break;
        await Future.delayed(_retryDelay * (i + 1));
      }
    }

    throw lastError ?? Exception('Failed to fetch data after $_maxRetries attempts');
  }

  Future<void> _cacheData(ProjectCategoryDataModelEntity data) async {
    if (_isDisposed || _box == null) return;

    try {
      final jsonData = jsonEncode(data.toJson());
      await _box?.putAll({
        _hiveKey: jsonData,
        _cacheTimeKey: DateTime.now().toIso8601String(),
      });
    } catch (e) {
      logService.crashLog(errorMessage: 'Failed to cache data', e: e);
    }
  }

  bool _isCacheExpired(DateTime cacheTime) {
    return DateTime.now().isAfter(cacheTime.add(_cacheDuration));
  }

  void dispose() {
    _isDisposed = true;
    _dataSubject.close();
    _box?.close();
    _box = null;
  }

  @override
  Future<Either<Failure, ProjectCategoryDataModelEntity>> call(NoParams params) async {
    if (_isDisposed) {
      return Left(ServerFailure('UseCase has been disposed'));
    }

    try {
      await _initCompleter.future;
      ProjectCategoryDataModelEntity? data = await _getCachedData();

      if (data == null) {
        try {
          data = await _fetchDataWithRetry();
          await _cacheData(data);
        } catch (e) {
          return Left(ServerFailure(e.toString()));
        }
      }

      if (!_isDisposed) _dataSubject.add(data);

      return Right(data);
    } catch (e) {
      logService.crashLog(errorMessage: 'Error in GetProjectCategoryDataUseCase', e: e);
      return Left(ServerFailure(e.toString()));
    }
  }

  Stream<ProjectCategoryDataModelEntity> get dataStream => _dataSubject.stream;
}
