import 'package:todo_app/core/app_library.dart';

/// Doc Required
class AuthDependencyInjection {
  /// Doc Required
  static void authDependency() {
    getIt
      ..registerSingleton<RestApi>(
        RestApiImpl(
          baseUrl: baseUrl,
          userCredentials: userCredentials,
        ),
      )
      ..registerSingleton<UserBaseApi>(
        getIt(),
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

  /// Doc Required
  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<RestApi>()
      ..unregister<UserBaseApi>()
      ..unregister<AuthRepository>()
      ..unregister<LoginUseCase>()
      ..unregister<GetUserDetailUseCase>()
      ..unregister<StandardLogoutUseCase>()
      ..unregister<AuthBloc>();
  }
}
