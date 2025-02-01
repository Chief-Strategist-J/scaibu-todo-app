part of use_case;

/// Doc Required
class GetAllSeededTagsUseCase extends UseCase<List<TagEntity>, NoParams> {
  /// Doc Required
  GetAllSeededTagsUseCase({
    required this.tagsDatabaseRepository,
  }) : _inMemoryCache = InMemoryCache<List<TagEntity>>(_config.cacheDuration);

  /// Doc Required
  Box<dynamic>? _box;

  /// Doc Required
  final HelperTagRepository<TagEntity> tagsDatabaseRepository;
  final AsyncLock _lock = AsyncLock();
  final InMemoryCache<List<TagEntity>> _inMemoryCache;

  static const CacheConfig _config = CacheConfig(
    boxName: 'seeded_tags_cache',
    dataKey: 'seeded_tags',
    timeKey: 'cache_time',
    cacheDuration: Duration(days: 7),
    maxCacheSize: 1024 * 1024,
  );

  Future<void> _initializeCache() async {
    _box ??= await Hive.openBox(_config.boxName);
  }

  Future<List<TagEntity>?> _getStorageCache() async {
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
          .map(TagEntity.fromJson)
          .toList();
    } catch (e) {
      await _clearStorageCache();
      return null;
    }
  }

  Future<void> _setStorageCache(final List<TagEntity> tags) async {
    final String jsonData =
        jsonEncode(tags.map((final TagEntity e) => e.toJson()).toList());
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
  Future<Either<Failure, List<TagEntity>>> call(final NoParams params) async =>
      _lock.synchronized(() async {
        try {
          final List<TagEntity>? inMemoryData = _inMemoryCache.validData;
          if (inMemoryData != null) {
            return Right<Failure, List<TagEntity>>(inMemoryData);
          }

          await _initializeCache();
          final List<TagEntity>? storedData = await _getStorageCache();
          if (storedData != null) {
            _inMemoryCache.setData(storedData);
            return Right<Failure, List<TagEntity>>(storedData);
          }

          final List<TagEntity> freshData =
              await tagsDatabaseRepository.getAllSeededTags();
          _inMemoryCache.setData(freshData);
          await _setStorageCache(freshData);
          return Right<Failure, List<TagEntity>>(freshData);
        } catch (e) {
          return Left<Failure, List<TagEntity>>(ServerFailure(e.toString()));
        }
      });
}
