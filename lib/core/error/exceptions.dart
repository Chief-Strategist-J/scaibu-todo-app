/// Exception thrown when attempting to access empty cache data.
class EmptyCacheException implements Exception {
  final String message;

  EmptyCacheException([this.message = 'Cache is empty.']);

  @override
  String toString() => 'EmptyCacheException: $message';
}

class CacheRefreshException implements Exception {
  final String message;

  CacheRefreshException([this.message = 'Cannot refresh empty cache.']);

  @override
  String toString() => 'CacheRefreshException: $message';
}
