import 'package:todo_app/core/app_library.dart';

/// Doc Required
sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class AuthInitState extends AuthState {
  /// Doc Required
  AuthInitState({required this.userEntity, required this.accessToken});

  /// Doc Required
  final UserEntity userEntity;

  /// Doc Required
  final String accessToken;
}

/// Doc Required
class EmptyState extends AuthState {}
