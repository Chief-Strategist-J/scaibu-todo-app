library use_case;

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:todo_app/core/app_library.dart';

part 'package:todo_app/feature/todo/domain/useCase/update_todo_use_case.dart';
part 'package:todo_app/feature/todo/domain/useCase/get_todo_list_use_case.dart';
part 'package:todo_app/feature/todo/domain/useCase/delete_todo_use_case.dart';
part 'package:todo_app/feature/todo/domain/useCase/create_todo_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/update_tag_use_case.dart';

part 'package:todo_app/feature/auth/domain/useCases/standard_logout_use_case.dart';
part 'package:todo_app/feature/auth/domain/useCases/login_use_case.dart';
part 'package:todo_app/feature/auth/domain/useCases/get_user_detail_use_case.dart';

/// Abstract base class for use cases.
sealed class UseCase<Type, Params> {
  /// Executes the use case logic with the provided [params].
  Future<Either<Failure, Type>> call(final Params params);
}

/// TO-DO: implement call
class UseCaseType extends UseCase<Type, int> {
  @override
  Future<Either<Failure, Type>> call(final int params) {
    // TO-DO: implement call
    throw UnimplementedError();
  }
}

/// A class representing a scenario where no parameters
/// are required for a use case.
class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[]; // No parameters, returns an empty list.
}
