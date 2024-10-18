import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:todo_app/core/app_library.dart';

class GetAllSeededTagsUseCase extends UseCase<List<TagEntity>, NoParams> {
  final HelperTagRepository<TagEntity> tagsDatabaseRepository;

  // Hive box and keys for caching
  static const _hiveBoxName = 'seeded_tags_cache';
  static const _hiveKey = 'seeded_tags';
  static const _cacheTimeKey = 'cache_time';
  static const _cacheDuration = Duration(days: 7);
  static const _encryptionKeyKey = 'encryption_key';

  late encrypt.Encrypter _encrypter;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Completer<void>? _initializationCompleter;

  GetAllSeededTagsUseCase({required this.tagsDatabaseRepository});

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

  Future<List<TagEntity>?> _getCachedTags(Box box) async {
    final encryptedData = box.get(_hiveKey);
    final cacheTime = box.get(_cacheTimeKey);
    final ivString = box.get('iv_key'); // Retrieve the IV

    if (encryptedData != null && cacheTime != null && ivString != null && !_isCacheExpired(cacheTime)) {
      try {
        final iv = encrypt.IV.fromBase64(ivString); // Use the stored IV
        final decryptedData = _encrypter.decrypt64(encryptedData, iv: iv);
        final List<dynamic> decodedData = jsonDecode(decryptedData);
        return decodedData.map((e) => TagEntity.fromJson(e)).toList();
      } catch (e) {
        // Handle decryption error
        logService.crashLog(errorMessage: 'Failed to decrypt cached tags', e: e);
        return null; // or handle the error accordingly
      }
    }
    return null;
  }

  Future<List<TagEntity>> _fetchAndCacheTags(Box box) async {
    final tags = await tagsDatabaseRepository.getAllSeededTags();
    await _cacheTags(box, tags);
    return tags;
  }

  Future<void> _cacheTags(Box box, List<TagEntity> tags) async {
    final jsonData = jsonEncode(tags.map((e) => e.toJson()).toList());
    final iv = encrypt.IV.fromLength(16); // Generate a new IV
    final encryptedData = _encrypter.encrypt(jsonData, iv: iv).base64;

    await box.put(_hiveKey, encryptedData);
    await box.put(_cacheTimeKey, DateTime.now().toIso8601String());
    await box.put('iv_key', iv.base64); // Store the IV with the encrypted data
  }

  bool _isCacheExpired(String cacheTimeString) {
    final cacheTime = DateTime.parse(cacheTimeString);
    return DateTime.now().isAfter(cacheTime.add(_cacheDuration));
  }

  @override
  Future<Either<Failure, List<TagEntity>>> call(NoParams params) async {
    try {
      await _initializeEncryption();

      final box = await Hive.openBox(_hiveBoxName);
      final cachedTags = await _getCachedTags(box) ?? await _fetchAndCacheTags(box);

      return Right(cachedTags);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to retrieve seeded tags', e: e, stack: s);
      return Left(ServerFailure('Failed to retrieve seeded tags: ${e.toString()}'));
    }
  }
}
