import 'package:todo_app/core/app_library.dart';


// Decoupling: Your architecture is decoupled, meaning the TagBloc can work with
// either TagsRepositoryImpl without knowing the specifics of how they are implemented.
// This makes your codebase more modular and maintainable.

// Flexibility: You can easily switch between different implementations of
// the TagsRemoteBase or the TagsRepository without changing the TagBloc code.
// Just register a different implementation.

// Clarity: The use of distinct instance names makes it clear which repository
// or remote data source you are working with, improving the readability and maintainability
// of your dependency injection setup.

// most importantly that only the implementation is register
// and abstract class is used only for declaring parameter

class TagsDependencyInjection {
  static const archiveTagUseCase = 'archive_tag_use_case';
  static const bulkCreateTagsUseCase = 'bulk_create_tags_use_case';
  static const bulkDeleteTagsUseCase = 'bulk_delete_tags_use_case';
  static const createTagUseCase = 'create_tag_use_case';
  static const deleteTagUseCase = 'delete_tag_use_case';
  static const getAllTagsUseCase = 'get_all_tags_use_case';
  static const getTagByIdUseCase = 'get_tag_by_id_use_case';
  static const restoreTagUseCase = 'restore_tag_use_case';
  static const searchTagsUseCase = 'search_tags_use_case';
  static const updateTagUseCase = 'update_tag_use_case';
  static const getAllSeededTagsUseCase = 'get_all_seeded_tags_use_case';

  static const tagsRemoteDatabase = 'tags_remote_database';
  static const tagsRemoteFirebase = 'tags_remote_firebase';
  static const tagsRemoteDatabaseImplementation = 'tags_remote_database_implementation';
  static const tagsRemoteFirebaseImplementation = 'tags_remote_firebase_implementation';
  static const tagsRemoteDatabaseImplementationWithHelper = 'tags_remote_database_implementation_with_helper';
  static const tagsRepositoryImpl = 'tags_repository_impl';
  static const tagBloc = 'tag_bloc';

  static void setupDependencyInjection() {
    getIt.registerSingleton<TagsRemoteBase<TagEntity>>(
      TagsRemoteDatabaseApi(getIt<RestApi>()),
      instanceName: TagsDependencyInjection.tagsRemoteDatabase,
    );

    getIt.registerSingleton<TagsRemoteBase<TagEntity>>(
      TagsRemoteFirebaseApi(),
      instanceName: TagsDependencyInjection.tagsRemoteFirebase,
    );

    getIt.registerSingleton<TagsRepository<TagEntity>>(
      instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
      TagsRepositoryImpl(base: getIt<TagsRemoteBase<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebase)),
    );

    getIt.registerSingleton<TagsRepository<TagEntity>>(
      instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
      TagsRepositoryImpl(base: getIt<TagsRemoteBase<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabase)),
    );

    getIt.registerSingleton<HelperTagRepository<TagEntity>>(
      TagsRemoteDatabaseApi(getIt<RestApi>()),
      instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper,
    );

    // Register TagBloc
    getIt.registerFactory<TagBloc>(
      instanceName: TagsDependencyInjection.tagBloc,
      () {
        return TagBloc(
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        );
      },
    );

    getIt.registerSingleton<ArchiveTagUseCase>(
      instanceName: TagsDependencyInjection.archiveTagUseCase,
      ArchiveTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<BulkCreateTagsUseCase>(
      instanceName: TagsDependencyInjection.bulkCreateTagsUseCase,
      BulkCreateTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<BulkDeleteTagsUseCase>(
      instanceName: TagsDependencyInjection.bulkDeleteTagsUseCase,
      BulkDeleteTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<CreateTagUseCase>(
      instanceName: TagsDependencyInjection.createTagUseCase,
      CreateTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<DeleteTagUseCase>(
      instanceName: TagsDependencyInjection.deleteTagUseCase,
      DeleteTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<GetAllTagsUseCase>(
      instanceName: TagsDependencyInjection.getAllTagsUseCase,
      GetAllTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<GetTagByIdUseCase>(
      instanceName: TagsDependencyInjection.getTagByIdUseCase,
      GetTagByIdUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<RestoreTagUseCase>(
      instanceName: TagsDependencyInjection.restoreTagUseCase,
      RestoreTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<SearchTagsUseCase>(
      instanceName: TagsDependencyInjection.searchTagsUseCase,
      SearchTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
      ),
    );

    getIt.registerSingleton<UpdateTagUseCase>(
      instanceName: TagsDependencyInjection.updateTagUseCase,
      UpdateTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation),
      ),
    );

    getIt.registerSingleton<GetAllSeededTagsUseCase>(
      instanceName: TagsDependencyInjection.getAllSeededTagsUseCase,
      GetAllSeededTagsUseCase(
        tagsDatabaseRepository: getIt<HelperTagRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper,
        ),
      ),
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<TagsRemoteBase<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabase);
    getIt.unregister<TagsRemoteBase<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebase);
    getIt.unregister<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation);
    getIt.unregister<TagsRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation);
    getIt.unregister<TagBloc>(instanceName: TagsDependencyInjection.tagBloc);
    getIt.unregister<ArchiveTagUseCase>(instanceName: TagsDependencyInjection.archiveTagUseCase);
    getIt.unregister<BulkCreateTagsUseCase>(instanceName: TagsDependencyInjection.bulkCreateTagsUseCase);
    getIt.unregister<BulkDeleteTagsUseCase>(instanceName: TagsDependencyInjection.bulkDeleteTagsUseCase);
    getIt.unregister<CreateTagUseCase>(instanceName: TagsDependencyInjection.createTagUseCase);
    getIt.unregister<DeleteTagUseCase>(instanceName: TagsDependencyInjection.deleteTagUseCase);
    getIt.unregister<GetAllTagsUseCase>(instanceName: TagsDependencyInjection.getAllTagsUseCase);
    getIt.unregister<GetTagByIdUseCase>(instanceName: TagsDependencyInjection.getTagByIdUseCase);
    getIt.unregister<RestoreTagUseCase>(instanceName: TagsDependencyInjection.restoreTagUseCase);
    getIt.unregister<SearchTagsUseCase>(instanceName: TagsDependencyInjection.searchTagsUseCase);
    getIt.unregister<UpdateTagUseCase>(instanceName: TagsDependencyInjection.updateTagUseCase);
    getIt.unregister<GetAllSeededTagsUseCase>(instanceName: TagsDependencyInjection.getAllSeededTagsUseCase);
    getIt.unregister<HelperTagRepository<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementationWithHelper);
  }
}
