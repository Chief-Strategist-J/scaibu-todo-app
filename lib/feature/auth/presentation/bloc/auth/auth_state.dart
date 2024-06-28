import 'package:todo_app/core/app_library.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitState extends AuthState {
  final UserEntity userEntity;
  final String accessToken;

  AuthInitState({required this.userEntity, required this.accessToken});
}

class EmptyState extends AuthState {}


class SignInState extends AuthState {}
