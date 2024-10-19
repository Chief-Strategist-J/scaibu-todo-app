class CacheConfig {
  final String boxName;
  final String dataKey;
  final String timeKey;
  final Duration cacheDuration;
  final int maxCacheSize;

  const CacheConfig({
    required this.boxName,
    required this.dataKey,
    required this.timeKey,
    required this.cacheDuration,
    required this.maxCacheSize,
  });
}
