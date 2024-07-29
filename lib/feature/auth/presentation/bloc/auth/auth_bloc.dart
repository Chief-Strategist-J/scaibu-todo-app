import 'package:todo_app/core/app_library.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(EmptyState()) {
    on<AuthInitEvent>(_init);
  }

  void _init(AuthInitEvent event, Emitter<AuthState> emit) async {
    await getIt.isReady<UserCredentials>(instanceName: ServiceInstance.userCredentialsKey);
    final userEntity = UserEntity(
      email: userCredentials.getUserEmail,
      userId: userCredentials.getUserId,
    );

    final accessToken = userCredentials.getUserAccessToken;
    emit(AuthInitState(userEntity: userEntity, accessToken: accessToken.validate()));
  }
}
