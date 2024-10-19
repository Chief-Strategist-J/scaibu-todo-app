import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/cache/async_clock.dart';
import 'package:todo_app/core/network/cache/cache_config.dart';
import 'package:todo_app/core/network/cache/in_memory_cache.dart';

class GetProjectCategoryDataUseCase extends UseCase<ProjectCategoryDataModelEntity, NoParams> {
  Box? _box;

  final ProjectRepository<ProjectEntity> projectRepository;
  final AsyncLock _lock = AsyncLock();
  final InMemoryCache<ProjectCategoryDataModelEntity> _inMemoryCache;

  static const CacheConfig _config = CacheConfig(
    boxName: 'project_category_cache',
    dataKey: 'project_category_data',
    timeKey: 'cache_time',
    cacheDuration: Duration(hours: 24),
    maxCacheSize: 1024 * 1024,
  );

  GetProjectCategoryDataUseCase({
    required this.projectRepository,
  }) : _inMemoryCache = InMemoryCache(_config.cacheDuration);

  Future<void> _initializeCache() async {
    _box ??= await Hive.openBox(_config.boxName);
  }

  @override
  Future<Either<Failure, ProjectCategoryDataModelEntity>> call(NoParams params) async {
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

        final freshData = await projectRepository.getProjectCategoryData();
        _inMemoryCache.setData(freshData);
        await _setStorageCache(freshData);
        return Right(freshData);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    });
  }

  Future<ProjectCategoryDataModelEntity?> _getStorageCache() async {
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

      return ProjectCategoryDataModelEntity.fromJson(jsonDecode(jsonData));
    } catch (e) {
      await _clearStorageCache();
      return null;
    }
  }

  Future<void> _setStorageCache(ProjectCategoryDataModelEntity data) async {
    final jsonData = jsonEncode(data.toJson());
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
}
