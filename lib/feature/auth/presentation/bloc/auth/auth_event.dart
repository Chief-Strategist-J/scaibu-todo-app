import 'package:todo_app/core/app_library.dart';

abstract class AuthEvent extends Equatable {}

class AuthInitEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

