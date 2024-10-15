import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:todo_app/core/app_library.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, bool> {
  final TodoRepository databaseRepo;
  final TodoRepository firebaseRepo;

  static const _hiveBoxName = 'todo_list_cache';
  static const _hiveKey = 'todo_list';
  static const _cacheTimeKey = 'cache_time';
  static const _cacheDuration = Duration(days: 7);
  static const _encryptionKeyKey = 'encryption_key';

  late encrypt.Encrypter _encrypter;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  Completer<void>? _initializationCompleter;

  GetTodoListUseCase({required this.databaseRepo, required this.firebaseRepo});

  Future<void> _initializeEncryption() async {
    if (_initializationCompleter != null) {
      return _initializationCompleter!.future;
    }

    _initializationCompleter = Completer<void>();

    try {
      final storedKey = await _secureStorage.read(key: _encryptionKeyKey) ?? await _generateAndStoreKey();
      final key = encrypt.Key.fromBase64(storedKey);
      _encrypter = encrypt.Encrypter(encrypt.AES(key));
      _initializationCompleter!.complete();
    } catch (e) {
      _initializationCompleter!.completeError(e);
      rethrow;
    } finally {
      _initializationCompleter = null;
    }
  }

  Future<String> _generateAndStoreKey() async {
    final newKey = base64UrlEncode(List<int>.generate(32, (_) => Random.secure().nextInt(256)));
    await _secureStorage.write(key: _encryptionKeyKey, value: newKey);
    return newKey;
  }

  Future<List<TodoEntity>?> _getCachedTodos(Box box) async {
    final storedData = box.get(_hiveKey);
    final cacheTime = box.get(_cacheTimeKey);

    if (storedData != null && cacheTime != null && !_isCacheExpired(cacheTime)) {
      try {
        final parts = storedData.split(':');
        if (parts.length != 2) return null;

        final iv = encrypt.IV.fromBase64(parts[0]);
        final encryptedData = parts[1];

        final decryptedData = _encrypter.decrypt64(encryptedData, iv: iv);
        final List<dynamic> decodedData = jsonDecode(decryptedData);
        return decodedData.map((e) => TodoEntity.fromJson(e)).toList();
      } catch (e) {
        logService.crashLog(errorMessage: "Decryption error: $e", e: e);
        return null;
      }
    }
    return null;
  }

  static Future<void> clearEncryptedCache() async {
    final box = await Hive.openBox(_hiveBoxName);
    await box.delete(_hiveKey);
    await box.delete(_cacheTimeKey);
  }

  Future<List<TodoEntity>> _fetchAndCacheTodos(Box box) async {
    final todoList = await _fetchRemoteList();
    await _cacheTodos(box, todoList);
    return todoList;
  }

  Future<void> _cacheTodos(Box box, List<TodoEntity> todos) async {
    final jsonData = jsonEncode(todos.map((e) => e.toJson()).toList());
    final iv = encrypt.IV.fromLength(16); // Generate a new IV
    final encryptedData = _encrypter.encrypt(jsonData, iv: iv).base64;

    await box.put(_hiveKey, '${iv.base64}:$encryptedData');
    await box.put(_cacheTimeKey, DateTime.now().toIso8601String());
  }

  bool _isCacheExpired(String cacheTimeString) {
    final cacheTime = DateTime.parse(cacheTimeString);
    return DateTime.now().isAfter(cacheTime.add(_cacheDuration));
  }

  // Fetch list from the remote database
  Future<List<TodoEntity>> _fetchRemoteList() async {
    try {
      return await databaseRepo.getListOfTodos();
    } catch (e, s) {
      logService.crashLog(errorMessage: "Error retrieving list from database", e: e, stack: s);
      throw 'Something went wrong: $e';
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> call(bool params) async {
    try {
      await _initializeEncryption();

      final box = await Hive.openBox(_hiveBoxName);

      final cachedTodos = await _getCachedTodos(box) ?? await _fetchAndCacheTodos(box);

      return Right(cachedTodos);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to fetch todo list', e: e, stack: s);
      return Left(ServerFailure('Error fetching todo list'));
    }
  }
}
