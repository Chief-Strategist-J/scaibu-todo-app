import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/error/exceptions.dart';

class InMemoryCache<T> {
  T? _data;
  DateTime? _timestamp;
  final Duration _duration;

  Function(T)? onDataStored;
  Function()? onCacheCleared;

  InMemoryCache(this._duration);

  InMemoryCache.withInitialData(this._duration, T initialData) {
    _storeData(initialData);
  }

  T? get validData => _isDataValid() ? _data : _clearAndReturnNull();

  DateTime? get timestamp => _timestamp;

  Duration get duration => _duration;

  bool _isDataValid() {
    return _data != null && _timestamp != null && !_hasExpired();
  }

  bool _hasExpired() {
    return DateTime.now().difference(_timestamp!) > _duration;
  }

  T? _clearAndReturnNull() {
    _clearData();
    return null;
  }

  void _storeData(T data) {
    _data = data;
    _timestamp = DateTime.now();
    _logStorageEvent(data);
  }

  void _clearData() {
    _data = null;
    _timestamp = null;
    _logClearEvent();
  }

  void _logStorageEvent(T data) {
    debugPrint('Data stored in cache: $data at ${DateTime.now()}');
  }

  void _logClearEvent() {
    debugPrint('Cache cleared at ${DateTime.now()}');
  }

  bool isEmpty() {
    return _data == null;
  }

  void refresh(T data) {
    if (_data != null) {
      _storeData(data);
    } else {
      throw CacheRefreshException();
    }
  }

  void setData(T data) {
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
