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
  static const tagsRemoteDatabase = 'tags_remote_database';
  static const tagsRemoteFirebase = 'tags_remote_firebase';
  static const tagsRemoteDatabaseImplementation = 'tags_remote_database_implementation';
  static const tagsRemoteFirebaseImplementation = 'tags_remote_firebase_implementation';
  static const tagsRepositoryImpl = 'tags_repository_impl';
  static const tagBloc = 'tag_bloc';

  static void setupDependencyInjection() {
    getIt.registerSingleton<TagsRemoteBase>(
      TagsRemoteDatabaseApi(getIt<RestApi>()),
      instanceName: TagsDependencyInjection.tagsRemoteDatabase,
    );

    getIt.registerSingleton<TagsRemoteBase>(
      TagsRemoteFirebaseApi(),
      instanceName: TagsDependencyInjection.tagsRemoteFirebase,
    );

    getIt.registerSingleton<TagsRepository>(
      instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
      TagsRepositoryImpl(
        base: getIt<TagsRemoteBase>(instanceName: TagsDependencyInjection.tagsRemoteFirebase),
      ),
    );

    getIt.registerSingleton<TagsRepository>(
      instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
      TagsRepositoryImpl(
        base: getIt<TagsRemoteBase>(instanceName: TagsDependencyInjection.tagsRemoteDatabase),
      ),
    );

    // Register TagBloc
    getIt.registerFactory<TagBloc>(
      instanceName: TagsDependencyInjection.tagBloc,
      () {
        return TagBloc(
          tagsFirebaseRepository: getIt<TagsRepository>(
            instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation,
          ),
          tagsDatabaseRepository: getIt<TagsRepository>(
            instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation,
          ),
        );
      },
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<TagsRemoteBase>(instanceName: TagsDependencyInjection.tagsRemoteDatabase);
    getIt.unregister<TagsRemoteBase>(instanceName: TagsDependencyInjection.tagsRemoteFirebase);

    getIt.unregister<TagsRepository>(instanceName: TagsDependencyInjection.tagsRemoteFirebaseImplementation);
    getIt.unregister<TagsRepository>(instanceName: TagsDependencyInjection.tagsRemoteDatabaseImplementation);

    getIt.unregister<TagBloc>(instanceName: TagsDependencyInjection.tagBloc);
  }
}
