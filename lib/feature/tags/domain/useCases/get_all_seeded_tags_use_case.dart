import 'package:todo_app/core/app_library.dart';

class GetAllSeededTagsUseCase extends UseCase<List<TagEntity>, NoParams> {
  Box? _box;

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

  GetAllSeededTagsUseCase({
    required this.tagsDatabaseRepository,
  }) : _inMemoryCache = InMemoryCache(_config.cacheDuration);

  Future<void> _initializeCache() async {
    _box ??= await Hive.openBox(_config.boxName);
  }

  Future<List<TagEntity>?> _getStorageCache() async {
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

      return (jsonDecode(jsonData) as List)
          .map((e) => TagEntity.fromJson(e))
          .toList();
    } catch (e) {
      await _clearStorageCache();
      return null;
    }
  }

  Future<void> _setStorageCache(List<TagEntity> tags) async {
    final jsonData = jsonEncode(tags.map((e) => e.toJson()).toList());
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
  Future<Either<Failure, List<TagEntity>>> call(NoParams params) async {
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

        final freshData = await tagsDatabaseRepository.getAllSeededTags();
        _inMemoryCache.setData(freshData);
        await _setStorageCache(freshData);
        return Right(freshData);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    });
  }
}
