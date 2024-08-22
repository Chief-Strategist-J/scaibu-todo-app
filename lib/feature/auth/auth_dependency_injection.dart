import 'package:todo_app/core/app_library.dart';

class AuthDependencyInjection {
  static void authDependency() {
    getIt.registerSingleton<RestApi>(RestApiImpl());

    getIt.registerSingleton<UserBaseApi>(
      UserDatabaseImpl(restApi: getIt<RestApi>()),
    );

    getIt.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(baseApi: getIt<UserBaseApi>()),
    );

    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<AuthRepository>()),
    );

    getIt.registerSingleton<GetUserDetailUseCase>(
      GetUserDetailUseCase(getIt<AuthRepository>()),
    );

    getIt.registerSingleton<StandardLogoutUseCase>(
      StandardLogoutUseCase(getIt<AuthRepository>()),
    );

    getIt.registerFactory(() {
      return AuthBloc();
    });
  }

  static void disposeDependencyInjection() {
    getIt.unregister<RestApi>();
    getIt.unregister<UserBaseApi>();
    getIt.unregister<AuthRepository>();
    getIt.unregister<LoginUseCase>();
    getIt.unregister<GetUserDetailUseCase>();
    getIt.unregister<StandardLogoutUseCase>();
    getIt.unregister<AuthBloc>();
  }
}
