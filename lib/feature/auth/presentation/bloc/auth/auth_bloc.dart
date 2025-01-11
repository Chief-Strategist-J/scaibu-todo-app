import 'package:todo_app/core/app_library.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(EmptyState()) {
    on<AuthInitEvent>(_init);
  }

  void _init(final AuthInitEvent event, final Emitter<AuthState> emit) async {
    await getIt.isReady<UserCredentials>(
      instanceName: ServiceInstance.userCredentialsKey,
    );
    final UserEntity userEntity = UserEntity(
      email: userCredentials.getUserEmail,
      userId: userCredentials.getUserId,
    );

    final String? accessToken = userCredentials.getUserAccessToken;
    emit(AuthInitState(
        userEntity: userEntity, accessToken: accessToken.validate()));
  }
}
