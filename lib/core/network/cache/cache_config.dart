/// Configuration class for caching, including box name, data key,
/// expiration time, and cache size.
class CacheConfig {
  /// Initializes the CacheConfig with the provided parameters.
  const CacheConfig({
    required this.boxName,
    required this.dataKey,
    required this.timeKey,
    required this.cacheDuration,
    required this.maxCacheSize,
  });

  /// The name of the cache box.
  final String boxName;

  /// The key for the data stored in the cache.
  final String dataKey;

  /// The key for the time when the cache was last updated.
  final String timeKey;

  /// The duration for which the cache remains valid.
  final Duration cacheDuration;

  /// The maximum size of the cache.
  final int maxCacheSize;
}
