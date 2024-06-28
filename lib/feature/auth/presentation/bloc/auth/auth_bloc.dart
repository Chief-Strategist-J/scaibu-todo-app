import 'package:todo_app/core/app_library.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(EmptyState()) {
    on<AuthInitEvent>(_init);
    on<AuthSignInEvent>(_onSignIn);
  }

  void _init(AuthInitEvent event, Emitter<AuthState> emit) async {
    final userEntity = UserEntity(
      email: userCredentials.getUserEmail,
      userId: userCredentials.getUserId,
    );

    final accessToken = userCredentials.getUserAccessToken;

    emit(AuthInitState(userEntity: userEntity, accessToken: accessToken.validate()));
  }

  Future<void> _onSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(SignInState());
  }


}
