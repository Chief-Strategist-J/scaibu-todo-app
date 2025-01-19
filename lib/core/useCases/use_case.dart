import 'package:todo_app/core/app_library.dart';

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
