import 'package:todo_app/core/app_library.dart';

class AuthDependencyInjection {
  static void authDependency() {
    getIt..registerSingleton<RestApi>(
      RestApiImpl(
        baseUrl: baseUrl,
        userCredentials: userCredentials,
      ),
    )

    ..registerSingleton<UserBaseApi>(
      UserDatabaseImpl(restApi: getIt<RestApi>()),
    )

    ..registerSingleton<AuthRepository>(
      AuthRepositoryImpl(baseApi: getIt<UserBaseApi>()),
    )

    ..registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<AuthRepository>()),
    )

    ..registerSingleton<GetUserDetailUseCase>(
      GetUserDetailUseCase(getIt<AuthRepository>()),
    )

    ..registerSingleton<StandardLogoutUseCase>(
      StandardLogoutUseCase(getIt<AuthRepository>()),
    )

    ..registerFactory(AuthBloc.new);
  }

  static Future<void> disposeDependencyInjection() async {
    getIt..unregister<RestApi>()
    ..unregister<UserBaseApi>()
    ..unregister<AuthRepository>()
    ..unregister<LoginUseCase>()
    ..unregister<GetUserDetailUseCase>()
    ..unregister<StandardLogoutUseCase>()
    ..unregister<AuthBloc>();
  }
}
