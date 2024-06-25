import 'package:todo_app/core/app_library.dart';

abstract class AuthEvent extends Equatable {}

class AuthInitEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSingUpEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}