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

  // Encryption-related objects
  late encrypt.Encrypter _encrypter;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final _iv = encrypt.IV.fromLength(16);
  Completer<void>? _initializationCompleter;

  GetAllSeededTagsUseCase({required this.tagsDatabaseRepository});

  // Initialize the encryption key and encrypter
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

  // Generate and store a new encryption key in secure storage
  Future<String> _generateAndStoreKey() async {
    final newKey = base64UrlEncode(List<int>.generate(32, (_) => Random.secure().nextInt(256)));
    await _secureStorage.write(key: _encryptionKeyKey, value: newKey);
    return newKey;
  }

  // Retrieve cached tags, decrypt, and return the list of TagEntity
  Future<List<TagEntity>?> _getCachedTags(Box box) async {
    final encryptedData = box.get(_hiveKey);
    final cacheTime = box.get(_cacheTimeKey);

    if (encryptedData != null && cacheTime != null && !_isCacheExpired(cacheTime)) {
      final decryptedData = _encrypter.decrypt64(encryptedData, iv: _iv);
      final List<dynamic> decodedData = jsonDecode(decryptedData);
      return decodedData.map((e) => TagEntity.fromJson(e)).toList();
    }
    return null;
  }

  // Fetch tags from the repository and cache them
  Future<List<TagEntity>> _fetchAndCacheTags(Box box) async {
    final tags = await tagsDatabaseRepository.getAllSeededTags();
    await _cacheTags(box, tags);
    return tags;
  }

  // Cache the tags by encrypting the data and storing it with the cache time
  Future<void> _cacheTags(Box box, List<TagEntity> tags) async {
    final jsonData = jsonEncode(tags.map((e) => e.toJson()).toList());
    final encryptedData = _encrypter.encrypt(jsonData, iv: _iv).base64;

    await box.put(_hiveKey, encryptedData);
    await box.put(_cacheTimeKey, DateTime.now().toIso8601String());
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
