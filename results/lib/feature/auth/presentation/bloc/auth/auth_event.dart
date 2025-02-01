import 'package:todo_app/core/app_library.dart';

/// Doc Required
abstract class AuthEvent extends Equatable {}

/// Doc Required
class AuthInitEvent extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}
