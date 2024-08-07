import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/data/data_sources/remote/tags_remote_database.dart';
import 'package:todo_app/feature/tags/data/data_sources/remote/tags_remote_firebase.dart';
import 'package:todo_app/feature/tags/data/data_sources/tags_remote_base.dart';
import 'package:todo_app/feature/tags/data/repositories/tags_repository_impl.dart';
import 'package:todo_app/feature/tags/domain/repositories/tags_repository.dart';

class TagsDependencyInjection {
  static const tagsRemoteDatabase = 'tags_remote_database';
  static const tagsRemoteFirebase = 'tags_remote_firebase';
  static const tagsRepositoryImpl = 'tags_repository_impl';

  void setupDependencyInjection() {
    getIt.registerSingleton<TagsRemoteBase>(
      TagsRemoteDatabase(getIt<RestApi>()),
      instanceName: TagsDependencyInjection.tagsRemoteDatabase,
    );

    getIt.registerSingleton<TagsRemoteBase>(
      TagsRemoteFirebase(),
      instanceName: TagsDependencyInjection.tagsRemoteFirebase,
    );

    getIt.registerSingleton<TagsRepository>(
      TagsRepositoryImpl(base: getIt<TagsRemoteBase>()),
      instanceName: TagsDependencyInjection.tagsRepositoryImpl,
    );
  }

  void disposeDependencyInjection() {
    getIt.unregister<TagsRemoteBase>(instanceName: TagsDependencyInjection.tagsRemoteDatabase);
    getIt.unregister<TagsRemoteBase>(instanceName: TagsDependencyInjection.tagsRemoteFirebase);
    getIt.unregister<TagsRepository>(instanceName: TagsDependencyInjection.tagsRepositoryImpl);
  }
}
