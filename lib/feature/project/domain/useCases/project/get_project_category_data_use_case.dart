part of use_case;

/// Doc Required
class GetProjectCategoryDataUseCase
    extends UseCase<ProjectCategoryDataModelEntity, NoParams> {
  /// Doc Required
  GetProjectCategoryDataUseCase({
    required this.projectRepository,
  }) : _inMemoryCache = InMemoryCache<ProjectCategoryDataModelEntity>(
          _config.cacheDuration,
        );
  Box<dynamic>? _box;

  /// Doc Required
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

  Future<void> _initializeCache() async {
    _box ??= await Hive.openBox(_config.boxName);
  }

  Future<ProjectCategoryDataModelEntity?> _getStorageCache() async {
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

      return ProjectCategoryDataModelEntity.fromJson(
        jsonDecode(jsonData) as Map<String, dynamic>,
      );
    } catch (e) {
      await _clearStorageCache();
      return null;
    }
  }

  Future<void> _setStorageCache(
    final ProjectCategoryDataModelEntity data,
  ) async {
    final String jsonData = jsonEncode(data.toJson());
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

  /// Doc Required
  @override
  Future<Either<Failure, ProjectCategoryDataModelEntity>> call(
    final NoParams params,
  ) async =>
      _lock.synchronized(() async {
        try {
          final ProjectCategoryDataModelEntity? inMemoryData =
              _inMemoryCache.validData;
          if (inMemoryData != null) {
            return Right<Failure, ProjectCategoryDataModelEntity>(inMemoryData);
          }

          await _initializeCache();
          final ProjectCategoryDataModelEntity? storedData =
              await _getStorageCache();
          if (storedData != null) {
            _inMemoryCache.setData(storedData);
            return Right<Failure, ProjectCategoryDataModelEntity>(storedData);
          }

          final ProjectCategoryDataModelEntity freshData =
              await projectRepository.getProjectCategoryData();
          _inMemoryCache.setData(freshData);
          await _setStorageCache(freshData);
          return Right<Failure, ProjectCategoryDataModelEntity>(freshData);
        } catch (e) {
          return Left<Failure, ProjectCategoryDataModelEntity>(
            ServerFailure(e.toString()),
          );
        }
      });
}
