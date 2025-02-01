import 'package:todo_app/core/app_library.dart';

// Decoupling: Your architecture is decoupled, meaning the TagBloc can work with
// either TagsRepositoryImpl without knowing the specifics of how they
// are implemented.
// This makes your codebase more modular and maintainable.

// Flexibility: You can easily switch between different implementations of
// the TagsRemoteBase or the TagsRepository without changing the TagBloc code.
// Just register a different implementation.

// Clarity: The use of distinct instance names makes it clear which repository
// or remotes data source you are working with, improving the readability
// and maintainability
// of your dependency injection setup.

// most importantly that only the implementation is register
// and abstract class is used only for declaring parameter

/// Doc Required
class TagsDependencyInjection {
  /// Doc Required
  static const String archiveTagUseCase = 'archive_tag_use_case';

  /// Doc Required
  static const String bulkCreateTagsUseCase = 'bulk_create_tags_use_case';

  /// Doc Required
  static const String bulkDeleteTagsUseCase = 'bulk_delete_tags_use_case';

  /// Doc Required
  static const String createTagUseCase = 'create_tag_use_case';

  /// Doc Required
  static const String deleteTagUseCase = 'delete_tag_use_case';

  /// Doc Required
  static const String getTagsByTodoIdUseCase = 'get_tags_by_todo_id_use_case';

  /// Doc Required
  static const String getAllTagsUseCase = 'get_all_tags_use_case';

  /// Doc Required
  static const String getTagByIdUseCase = 'get_tag_by_id_use_case';

  /// Doc Required
  static const String restoreTagUseCase = 'restore_tag_use_case';

  /// Doc Required
  static const String searchTagsUseCase = 'search_tags_use_case';

  /// Doc Required
  static const String bulkDeleteTagsByTodoIdUseCase =
      'bulk_delete_tags_by_todo_id_use_case';

  /// Doc Required
  static const String updateTagUseCase = 'update_tag_use_case';

  /// Doc Required
  static const String getAllSeededTagsUseCase = 'get_all_seeded_tags_use_case';

  /// Doc Required
  static const String getAllTagsByUserIdUseCase =
      'get_all_tags_by_user_id_use_case';

  /// Doc Required
  static const String tagsRemoteDatabase = 'tags_remote_database';

  /// Doc Required
  static const String tagsRemoteFirebase = 'tags_remote_firebase';

  /// Doc Required
  static const String tagsRemoteDatabaseImplementation =
      'tags_remote_database_implementation';

  /// Doc Required
  static const String tagsRemoteFirebaseImplementation =
      'tags_remote_firebase_implementation';

  /// Doc Required
  static const String tagsRemoteDatabaseImplementationWithHelper =
      'tags_remote_database_implementation_with_helper';

  /// Doc Required
  static const String tagsRepositoryImpl = 'tags_repository_impl';

  /// Doc Required

  static const String tagBloc = 'tag_bloc';

  /// Doc Required

  static void setupDependencyInjection() {
    getIt
      ..registerSingleton<TagsRemoteBase<TagEntity>>(
        TagsRemoteDatabaseApi(getIt<RestApi>()),
        instanceName: TagsDependencyInjection.tagsRemoteDatabase,
      )
      ..registerSingleton<TagsRemoteBase<TagEntity>>(
        TagsRemoteFirebaseApi(),
        instanceName: TagsDependencyInjection.tagsRemoteFirebase,
      )
      ..registerSingleton<TagsRepository<TagEntity>>(
        instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        TagsRepositoryImpl(
          base: getIt<TagsRemoteBase<TagEntity>>(
            instanceName: TagsDependencyInjection.tagsRemoteFirebase,
          ),
        ),
      )
      ..registerSingleton<TagsRepository<TagEntity>>(
        instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        TagsRepositoryImpl(
          base: getIt<TagsRemoteBase<TagEntity>>(
            instanceName: TagsDependencyInjection.tagsRemoteDatabase,
          ),
        ),
      )
      ..registerSingleton<HelperTagRepository<TagEntity>>(
        TagsRemoteDatabaseApi(getIt<RestApi>()),
        instanceName:
            TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper,
      )

      // Register TagBloc
      ..registerFactory<TagBloc>(
        instanceName: TagsDependencyInjection.tagBloc,
        () => TagBloc(
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
        ),
      )
      ..registerSingleton<ArchiveTagUseCase>(
        instanceName: TagsDependencyInjection.archiveTagUseCase,
        ArchiveTagUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<BulkCreateTagsUseCase>(
        instanceName: TagsDependencyInjection.bulkCreateTagsUseCase,
        BulkCreateTagsUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<BulkDeleteTagsUseCase>(
        instanceName: TagsDependencyInjection.bulkDeleteTagsUseCase,
        BulkDeleteTagsUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<CreateTagUseCase>(
        instanceName: TagsDependencyInjection.createTagUseCase,
        CreateTagUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<DeleteTagUseCase>(
        instanceName: TagsDependencyInjection.deleteTagUseCase,
        DeleteTagUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<GetTagsByTodoIdUseCase>(
        instanceName: TagsDependencyInjection.getTagsByTodoIdUseCase,
        GetTagsByTodoIdUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
        ),
      )
      ..registerSingleton<GetAllTagsUseCase>(
        instanceName: TagsDependencyInjection.getAllTagsUseCase,
        GetAllTagsUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<GetTagByIdUseCase>(
        instanceName: TagsDependencyInjection.getTagByIdUseCase,
        GetTagByIdUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<RestoreTagUseCase>(
        instanceName: TagsDependencyInjection.restoreTagUseCase,
        RestoreTagUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<SearchTagsUseCase>(
        instanceName: TagsDependencyInjection.searchTagsUseCase,
        SearchTagsUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
        ),
      )
      ..registerSingleton<BulkDeleteTagsByTodoIdUseCase>(
        instanceName: TagsDependencyInjection.bulkDeleteTagsByTodoIdUseCase,
        BulkDeleteTagsByTodoIdUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
        ),
      )
      ..registerSingleton<UpdateTagUseCase>(
        instanceName: TagsDependencyInjection.updateTagUseCase,
        UpdateTagUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<GetAllSeededTagsUseCase>(
        instanceName: TagsDependencyInjection.getAllSeededTagsUseCase,
        GetAllSeededTagsUseCase(
          tagsDatabaseRepository: getIt<HelperTagRepository<TagEntity>>(
            instanceName: TagsDependencyInjection
                .tagsRemoteDatabaseImplementationWithHelper,
          ),
        ),
      )
      ..registerSingleton<GetAllTagsByUserIdUseCase>(
        instanceName: TagsDependencyInjection.getAllTagsByUserIdUseCase,
        GetAllTagsByUserIdUseCase(
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName:
                TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
        ),
      );
  }

  /// Doc Required
  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<TagsRemoteBase<TagEntity>>(
        instanceName: TagsDependencyInjection.tagsRemoteDatabase,
      )
      ..unregister<TagsRemoteBase<TagEntity>>(
        instanceName: TagsDependencyInjection.tagsRemoteFirebase,
      )
      ..unregister<TagsRepository<TagEntity>>(
        instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
      )
      ..unregister<TagsRepository<TagEntity>>(
        instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
      )
      ..unregister<TagBloc>(instanceName: TagsDependencyInjection.tagBloc)
      ..unregister<ArchiveTagUseCase>(
        instanceName: TagsDependencyInjection.archiveTagUseCase,
      )
      ..unregister<BulkCreateTagsUseCase>(
        instanceName: TagsDependencyInjection.bulkCreateTagsUseCase,
      )
      ..unregister<BulkDeleteTagsUseCase>(
        instanceName: TagsDependencyInjection.bulkDeleteTagsUseCase,
      )
      ..unregister<CreateTagUseCase>(
        instanceName: TagsDependencyInjection.createTagUseCase,
      )
      ..unregister<DeleteTagUseCase>(
        instanceName: TagsDependencyInjection.deleteTagUseCase,
      )
      ..unregister<GetTagsByTodoIdUseCase>(
        instanceName: TagsDependencyInjection.getTagsByTodoIdUseCase,
      )
      ..unregister<GetAllTagsUseCase>(
        instanceName: TagsDependencyInjection.getAllTagsUseCase,
      )
      ..unregister<GetTagByIdUseCase>(
        instanceName: TagsDependencyInjection.getTagByIdUseCase,
      )
      ..unregister<RestoreTagUseCase>(
        instanceName: TagsDependencyInjection.restoreTagUseCase,
      )
      ..unregister<SearchTagsUseCase>(
        instanceName: TagsDependencyInjection.searchTagsUseCase,
      )
      ..unregister<BulkDeleteTagsByTodoIdUseCase>(
        instanceName: TagsDependencyInjection.bulkDeleteTagsByTodoIdUseCase,
      )
      ..unregister<UpdateTagUseCase>(
        instanceName: TagsDependencyInjection.updateTagUseCase,
      )
      ..unregister<GetAllSeededTagsUseCase>(
        instanceName: TagsDependencyInjection.getAllSeededTagsUseCase,
      )
      ..unregister<GetAllTagsByUserIdUseCase>(
        instanceName: TagsDependencyInjection.getAllTagsByUserIdUseCase,
      )
      ..unregister<HelperTagRepository<TagEntity>>(
        instanceName:
            TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper,
      );
  }
}
