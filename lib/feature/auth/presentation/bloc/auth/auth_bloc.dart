import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/data/dataSource/local/user_credentials.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(EmptyState()) {
    on<AuthInitEvent>(_init);
    on<AuthSignInEvent>(_onSignIn);
    on<AuthSingUpEvent>(_onSignUp);
  }

  void _init(AuthInitEvent event, Emitter<AuthState> emit) async {
    final userEntity = UserEntity(
      email: await UserCredentials.getUserEmail,
      userId: await UserCredentials.getUserId,
    );

    final accessToken = await UserCredentials.getUserAccessToken;
    emit(AuthInitState(userEntity: userEntity, accessToken: accessToken.validate()));
  }

  Future<void> _onSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(SignInState());
  }
  Future<void> _onSignUp(AuthSingUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpState());
  }
}
