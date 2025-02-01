import 'package:todo_app/core/app_library.dart';

/// A generic in-memory cache class to store data with expiration and refresh
/// capabilities.
class InMemoryCache<T> {
  /// Initializes the cache with a specified duration.
  InMemoryCache(this._duration);

  /// Initializes the cache with a specified duration and optional initial data.
  InMemoryCache.withInitialData(this._duration, final T initialData) {
    _storeData(initialData);
  }

  T? _data;
  DateTime? _timestamp;
  final Duration _duration;

  /// Callback triggered when data is stored in the cache.
  T Function(T)? onDataStored;

  /// Callback triggered when the cache is cleared.
  T Function()? onCacheCleared;

  /// Returns valid data if not expired, or clears the cache and returns null.
  T? get validData => _isDataValid() ? _data : _clearAndReturnNull();

  /// Returns the timestamp when the cache was last updated.
  DateTime? get timestamp => _timestamp;

  /// Returns the duration for which the cache is valid.
  Duration get duration => _duration;

  /// Checks if the data is still valid based on expiration.
  bool _isDataValid() => _data != null && _timestamp != null && !_hasExpired();

  /// Checks if the data has expired.
  bool _hasExpired() => DateTime.now().difference(_timestamp!) > _duration;

  /// Clears the cache and returns null.
  T? _clearAndReturnNull() {
    _clearData();
    return null;
  }

  /// Stores data in the cache and updates the timestamp.
  void _storeData(final T data) {
    _data = data;
    _timestamp = DateTime.now();
    _logStorageEvent(data);
  }

  /// Clears the stored data and timestamp.
  void _clearData() {
    _data = null;
    _timestamp = null;
    _logClearEvent();
  }

  /// Logs the event when data is stored in the cache.
  void _logStorageEvent(final T data) {
    debugPrint('Data stored in cache: $data at ${DateTime.now()}');
  }

  /// Logs the event when the cache is cleared.
  void _logClearEvent() {
    debugPrint('Cache cleared at ${DateTime.now()}');
  }

  /// Checks if the cache is empty.
  bool isEmpty() => _data == null;

  /// Refreshes the cache with new data.
  void refresh(final T data) {
    if (_data != null) {
      _storeData(data);
    } else {
      throw CacheRefreshException();
    }
  }

  /// Sets data in the cache and triggers the `onDataStored` callback.
  void setData(final T data) {
    _storeData(data);
    onDataStored?.call(data);
  }

  /// Clears the cache and triggers the `onCacheCleared` callback.
  void clear() {
    _clearData();
    onCacheCleared?.call();
  }

  /// Retrieves the current data, throwing an exception if the cache is empty.
  T? get currentData {
    if (isEmpty()) {
      throw EmptyCacheException();
    }
    return _data;
  }
}
