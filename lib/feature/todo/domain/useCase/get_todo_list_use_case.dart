part of use_case;

/// Doc Required
class GetTodoListUseCase extends UseCase<List<TodoEntity>, bool> {
  /// Doc Required
  GetTodoListUseCase({
    required final TodoRepository databaseRepo,
  }) : _databaseRepo = databaseRepo;

  final TodoRepository _databaseRepo;

  static const String _hiveBoxName = 'todo_list_cache';
  static const String _hiveKey = 'todo_list';
  static const String _cacheTimeKey = 'cache_time';
  static const Duration _cacheDuration = Duration(days: 7);
  static const String _encryptionKeyKey = 'encryption_key';

  late encrypt.Encrypter _encrypter;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  Completer<void>? _initializationCompleter;

  Future<void> _initializeEncryption() async {
    if (_initializationCompleter != null) {
      return _initializationCompleter!.future;
    }

    _initializationCompleter = Completer<void>();

    try {
      final String storedKey =
          await _secureStorage.read(key: _encryptionKeyKey) ??
              await _generateAndStoreKey();
      final encrypt.Key key = encrypt.Key.fromBase64(storedKey);
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
    final String newKey = base64UrlEncode(
      List<int>.generate(32, (final _) => Random.secure().nextInt(256)),
    );
    await _secureStorage.write(key: _encryptionKeyKey, value: newKey);
    return newKey;
  }

  Future<List<TodoEntity>?> _getCachedTodos(final Box<dynamic> box) async {
    final String? storedData = box.get(_hiveKey) as String?;
    final String? cacheTime = box.get(_cacheTimeKey) as String?;

    if (storedData != null &&
        cacheTime != null &&
        !_isCacheExpired(cacheTime)) {
      try {
        final List<String> parts = storedData.split(':');
        if (parts.length != 2) {
          return null;
        }

        final encrypt.IV iv = encrypt.IV.fromBase64(parts[0]);
        final String encryptedData = parts[1];

        final String decryptedData =
            _encrypter.decrypt64(encryptedData, iv: iv);
        final dynamic decodedData = jsonDecode(decryptedData);

        return (decodedData as List<Map<String, dynamic>>)
            .map(TodoEntity.fromJson)
            .toList();
      } catch (e) {
        await logService.crashLog(errorMessage: 'Decryption error: $e', e: e);
        return null;
      }
    }
    return null;
  }

  /// Doc Required
  static Future<void> clearEncryptedCache() async {
    final Box<dynamic> box = await Hive.openBox(_hiveBoxName);
    await box.delete(_hiveKey);
    await box.delete(_cacheTimeKey);
  }

  Future<List<TodoEntity>> _fetchAndCacheTodos(final Box<dynamic> box) async {
    final List<TodoEntity> todoList = await _fetchRemoteList();
    await _cacheTodos(box, todoList);
    return todoList;
  }

  Future<void> _cacheTodos(
    final Box<dynamic> box,
    final List<TodoEntity> todos,
  ) async {
    final String jsonData =
        jsonEncode(todos.map((final TodoEntity e) => e.toJson()).toList());
    final encrypt.IV iv = encrypt.IV.fromLength(16); // Generate a new IV
    final String encryptedData = _encrypter.encrypt(jsonData, iv: iv).base64;

    await box.put(_hiveKey, '${iv.base64}:$encryptedData');
    await box.put(_cacheTimeKey, DateTime.now().toIso8601String());
  }

  bool _isCacheExpired(final String cacheTimeString) {
    final DateTime cacheTime = DateTime.parse(cacheTimeString);
    return DateTime.now().isAfter(cacheTime.add(_cacheDuration));
  }

  // Fetch list from the remotes database
  Future<List<TodoEntity>> _fetchRemoteList() async {
    try {
      return await _databaseRepo.getListOfTodos();
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Error retrieving list from database',
        e: e,
        stack: s,
      );
      throw Exception('Something went wrong: $e');
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> call(final bool params) async {
    try {
      await _initializeEncryption();

      final Box<dynamic> box = await Hive.openBox(_hiveBoxName);

      final List<TodoEntity> cachedTodos =
         /* await _getCachedTodos(box) ?? */await _fetchAndCacheTodos(box);

      return Right<Failure, List<TodoEntity>>(cachedTodos);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to fetch todo list',
        e: e,
        stack: s,
      );
      return Left<Failure, List<TodoEntity>>(
        ServerFailure('Error fetching todo list'),
      );
    }
  }
}
