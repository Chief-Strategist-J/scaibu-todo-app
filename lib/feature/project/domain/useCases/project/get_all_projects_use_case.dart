part of use_case;

// TO-DO currently pagination is not added yet we have to add this
//  later and according to that we are
// going to change this code later
/// Doc Required
class GetAllProjectsUseCase extends UseCase<List<ProjectEntity>, NoParams> {
  /// Doc Required
  GetAllProjectsUseCase({required this.projectRepository})
      : _inMemoryCache =
            InMemoryCache<List<ProjectEntity>>(_config.cacheDuration);

  /// Doc Required
  Box<dynamic>? _box;

  /// Doc Required
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

  Future<void> _initializeCache() async {
    _box ??= await Hive.openBox(_config.boxName);
  }

  Future<List<ProjectEntity>?> _getStorageCache() async {
    if (_box == null) {
      return null;
    }
    try {
      final String? jsonData = _box!.get(_config.dataKey) as String?;
      final String? cacheTimeStr = _box!.get(_config.timeKey) as String?;
      if (jsonData == null || cacheTimeStr == null) {
        return null;
      }

      final DateTime cacheTime = DateTime.parse(cacheTimeStr);
      if (DateTime.now().difference(cacheTime) > _config.cacheDuration) {
        await _clearStorageCache();
        return null;
      }

      return (jsonDecode(jsonData) as List<Map<String, dynamic>>)
          .map(ProjectEntity.fromJson)
          .toList();
    } catch (e) {
      await _clearStorageCache();
      return null;
    }
  }

  Future<void> _setStorageCache(final List<ProjectEntity> projects) async {
    final String jsonData = jsonEncode(
      projects.map((final ProjectEntity e) => e.toJson()).toList(),
    );
    if (jsonData.length <= _config.maxCacheSize) {
      await _box?.put(_config.dataKey, jsonData);
      await _box?.put(_config.timeKey, DateTime.now().toIso8601String());
    }
  }

  Future<void> _clearStorageCache() async {
    await _box?.deleteAll(<dynamic>[_config.dataKey, _config.timeKey]);
  }

  /// Doc Required
  Future<void> clearCache() async {
    _inMemoryCache.clear();
    await _clearStorageCache();
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(
    final NoParams params,
  ) async =>
      _lock.synchronized(() async {
        try {
          final List<ProjectEntity>? inMemoryData = _inMemoryCache.validData;
          if (inMemoryData != null && inMemoryData.isNotEmpty) {
            return Right<Failure, List<ProjectEntity>>(inMemoryData);
          }

          await _initializeCache();
          final List<ProjectEntity>? storedData = await _getStorageCache();
          if (storedData != null && storedData.isNotEmpty) {
            _inMemoryCache.setData(storedData);
            return Right<Failure, List<ProjectEntity>>(storedData);
          }

          final List<ProjectEntity> freshData =
              await projectRepository.getAllProjects();

          _inMemoryCache.setData(freshData);
          await _setStorageCache(freshData);
          return Right<Failure, List<ProjectEntity>>(freshData);
        } catch (e) {
          return Left<Failure, List<ProjectEntity>>(
            ServerFailure(e.toString()),
          );
        }
      });
}
