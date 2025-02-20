import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoAuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Doc Required
  TodoAuthBloc() : super(EmptyState()) {
    on<AuthInitEvent>(_init);
  }

  Future<void> _init(
    final AuthInitEvent event,
    final Emitter<AuthState> emit,
  ) async {
    await getIt.isReady<UserCredentials>(
      instanceName: ServiceInstance.userCredentialsKey,
    );
    final UserEntity userEntity = UserEntity(
      email: userCredentials.getUserEmail,
      userId: userCredentials.getUserId,
    );

    final String? accessToken = userCredentials.getUserAccessToken;
    emit(
      AuthInitState(
        userEntity: userEntity,
        accessToken: accessToken.validate(),
      ),
    );
  }
}
