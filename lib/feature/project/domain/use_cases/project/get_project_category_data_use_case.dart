import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:todo_app/core/app_library.dart';

class GetProjectCategoryDataUseCase extends UseCase<ProjectCategoryDataModelEntity, NoParams> {
  final ProjectRepository<ProjectEntity> projectRepository;

  static const _hiveBoxName = 'project_category_data_cache';
  static const _hiveKey = 'project_category_data';
  static const _cacheTimeKey = 'cache_time';
  static const _cacheDuration = Duration(days: 7);
  static const _encryptionKeyKey = 'encryption_key';

  late encrypt.Encrypter _encrypter;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final _iv = encrypt.IV.fromLength(16);
  Completer<void>? _initializationCompleter;

  GetProjectCategoryDataUseCase({required this.projectRepository});

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

  Future<ProjectCategoryDataModelEntity?> _getCachedData(Box box) async {
    final encryptedData = box.get(_hiveKey);
    final cacheTime = box.get(_cacheTimeKey);

    if (encryptedData != null && cacheTime != null && !_isCacheExpired(cacheTime)) {
      final decryptedData = _encrypter.decrypt64(encryptedData, iv: _iv);
      return ProjectCategoryDataModelEntity.fromJson(jsonDecode(decryptedData));
    }
    return null;
  }

  Future<ProjectCategoryDataModelEntity> _fetchAndCacheData(Box box) async {
    final projectCategoryData = await projectRepository.getProjectCategoryData();
    await _cacheData(box, projectCategoryData);
    return projectCategoryData;
  }

  Future<void> _cacheData(Box box, ProjectCategoryDataModelEntity data) async {
    final jsonData = jsonEncode(data.toJson());
    final encryptedData = _encrypter.encrypt(jsonData, iv: _iv).base64;

    await box.put(_hiveKey, encryptedData);
    await box.put(_cacheTimeKey, DateTime.now().toIso8601String());
  }

  bool _isCacheExpired(String cacheTimeString) {
    final cacheTime = DateTime.parse(cacheTimeString);
    return DateTime.now().isAfter(cacheTime.add(_cacheDuration));
  }

  @override
  Future<Either<Failure, ProjectCategoryDataModelEntity>> call(NoParams params) async {
    try {
      await _initializeEncryption();

      final box = await Hive.openBox(_hiveBoxName);
      final cachedData = await _getCachedData(box) ?? await _fetchAndCacheData(box);

      return Right(cachedData);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to fetch project category data', e: e, stack: s);
      return Left(ServerFailure('Failed to fetch project category data: ${e.toString()}'));
    }
  }
}
