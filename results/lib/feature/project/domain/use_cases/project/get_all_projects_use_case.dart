import 'package:todo_app/core/app_library.dart';

// TODO currently pagination is not added yet we have to add this later and according to that we are
// going to change this code later
class GetAllProjectsUseCase extends UseCase<List<ProjectEntity>, NoParams> {
  Box? _box;

  final ProjectRepository<ProjectEntity> projectRepository;
  final AsyncLock _lock = AsyncLock();
  final InMemoryCache<List<ProjectEntity>> _inMemoryCache;

  static const CacheConfig _config = CacheConfig(
    boxName: 'projects_cache',
    dataKey: 'projects_data',
    timeKey: 'cache_time',
    cacheDuration: Duration(days: 7),
    maxCacheSize: 1024 * 1024,
  );

  GetAllProjectsUseCase({required this.projectRepository}) : _inMemoryCache = InMemoryCache(_config.cacheDuration);

  Future<void> _initializeCache() async {
    _box ??= await Hive.openBox(_config.boxName);
  }

  Future<List<ProjectEntity>?> _getStorageCache() async {
    if (_box == null) return null;
    try {
      final jsonData = _box!.get(_config.dataKey);
      final cacheTimeStr = _box!.get(_config.timeKey);
      if (jsonData == null || cacheTimeStr == null) return null;

      final cacheTime = DateTime.parse(cacheTimeStr);
      if (DateTime.now().difference(cacheTime) > _config.cacheDuration) {
        await _clearStorageCache();
        return null;
      }

      return (jsonDecode(jsonData) as List).map((e) => ProjectEntity.fromJson(e)).toList();
    } catch (e) {
      await _clearStorageCache();
      return null;
    }
  }

  Future<void> _setStorageCache(List<ProjectEntity> projects) async {
    final jsonData = jsonEncode(projects.map((e) => e.toJson()).toList());
    if (jsonData.length <= _config.maxCacheSize) {
      await _box?.put(_config.dataKey, jsonData);
      await _box?.put(_config.timeKey, DateTime.now().toIso8601String());
    }
  }

  Future<void> _clearStorageCache() async {
    await _box?.deleteAll([_config.dataKey, _config.timeKey]);
  }

  Future<void> clearCache() async {
    _inMemoryCache.clear();
    await _clearStorageCache();
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParams params) async {
    return await _lock.synchronized(() async {
      try {
        final inMemoryData = _inMemoryCache.validData;
        if (inMemoryData != null) {
          return Right(inMemoryData);
        }

        await _initializeCache();
        final storedData = await _getStorageCache();
        if (storedData != null) {
          _inMemoryCache.setData(storedData);
          return Right(storedData);
        }

        final freshData = await projectRepository.getAllProjects();
        _inMemoryCache.setData(freshData);
        await _setStorageCache(freshData);
        return Right(freshData);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    });
  }
}
