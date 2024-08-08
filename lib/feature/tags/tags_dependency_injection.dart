import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/domain/useCases/archive_tag_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/bulk_create_tags_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/bulk_delete_tags_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/create_tag_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/delete_tag_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/get_all_tags_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/get_tag_by_id_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/restore_tag_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/search_tags_use_case.dart';
import 'package:todo_app/feature/tags/domain/useCases/update_tag_use_case.dart';

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
  static const tagsRemoteDatabase = 'tags_remote_database';
  static const tagsRemoteFirebase = 'tags_remote_firebase';
  static const tagsRemoteDatabaseImplementation = 'tags_remote_database_implementation';
  static const tagsRemoteFirebaseImplementation = 'tags_remote_firebase_implementation';
  static const tagsRepositoryImpl = 'tags_repository_impl';
  static const tagBloc = 'tag_bloc';

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
      TagsRepositoryImpl(
        base: getIt<TagsRemoteBase<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteFirebase),
      ),
    );

    getIt.registerSingleton<TagsRepository<TagEntity>>(
      instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
      TagsRepositoryImpl(
        base: getIt<TagsRemoteBase<TagEntity>>(instanceName: TagsDependencyInjection.tagsRemoteDatabase),
      ),
    );

    // Register TagBloc
    getIt.registerFactory<TagBloc>(
      instanceName: TagsDependencyInjection.tagBloc,
      () {
        return TagBloc(
          tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
          tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
            instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
        );
      },
    );

    getIt.registerSingleton<ArchiveTagUseCase>(
      ArchiveTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.archiveTagUseCase,
    );

    getIt.registerSingleton<BulkCreateTagsUseCase>(
      BulkCreateTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.bulkCreateTagsUseCase,
    );

    getIt.registerSingleton<BulkDeleteTagsUseCase>(
      BulkDeleteTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.bulkDeleteTagsUseCase,
    );

    getIt.registerSingleton<CreateTagUseCase>(
      CreateTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.createTagUseCase,
    );

    getIt.registerSingleton<DeleteTagUseCase>(
      DeleteTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.deleteTagUseCase,
    );

    getIt.registerSingleton<GetAllTagsUseCase>(
      GetAllTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.getAllTagsUseCase,
    );

    getIt.registerSingleton<GetTagByIdUseCase>(
      GetTagByIdUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.getTagByIdUseCase,
    );

    getIt.registerSingleton<RestoreTagUseCase>(
      RestoreTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.restoreTagUseCase,
    );

    getIt.registerSingleton<SearchTagsUseCase>(
      SearchTagsUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.searchTagsUseCase,
    );

    getIt.registerSingleton<UpdateTagUseCase>(
      UpdateTagUseCase(
        tagsDatabaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
        ),
        tagsFirebaseRepository: getIt<TagsRepository<TagEntity>>(
          instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
        ),
      ),
      instanceName: TagsDependencyInjection.updateTagUseCase,
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
  }
}
