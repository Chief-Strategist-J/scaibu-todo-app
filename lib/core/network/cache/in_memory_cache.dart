import 'package:todo_app/core/app_library.dart';

class InMemoryCache<T> {
  InMemoryCache.withInitialData(this._duration, final T initialData) {
    _storeData(initialData);
  }

  InMemoryCache(this._duration);
  T? _data;
  DateTime? _timestamp;
  final Duration _duration;

  T Function(T)? onDataStored;
  T Function()? onCacheCleared;

  T? get validData => _isDataValid() ? _data : _clearAndReturnNull();

  DateTime? get timestamp => _timestamp;

  Duration get duration => _duration;

  bool _isDataValid() => _data != null && _timestamp != null && !_hasExpired();

  bool _hasExpired() => DateTime.now().difference(_timestamp!) > _duration;

  T? _clearAndReturnNull() {
    _clearData();
    return null;
  }

  void _storeData(final T data) {
    _data = data;
    _timestamp = DateTime.now();
    _logStorageEvent(data);
  }

  void _clearData() {
    _data = null;
    _timestamp = null;
    _logClearEvent();
  }

  void _logStorageEvent(final T data) {
    debugPrint('Data stored in cache: $data at ${DateTime.now()}');
  }

  void _logClearEvent() {
    debugPrint('Cache cleared at ${DateTime.now()}');
  }

  bool isEmpty() => _data == null;

  void refresh(final T data) {
    if (_data != null) {
      _storeData(data);
    } else {
      throw CacheRefreshException();
    }
  }

  void setData(final T data) {
    _storeData(data);
    onDataStored?.call(data);
  }

  void clear() {
    _clearData();
    onCacheCleared?.call();
  }

  T? get currentData {
    if (isEmpty()) {
      throw EmptyCacheException();
    }
    return _data;
  }
}
