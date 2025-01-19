import 'package:equatable/equatable.dart';

/// Abstract class representing a failure, extending Equatable for comparison.
abstract class Failure extends Equatable {}

/// A constant message indicating a connection failure.
const String messageConnectionFailure = 'messageConnectionFailure';

/// Represents a server failure, extending the Failure class.
class ServerFailure extends Failure {
  /// Initializes the ServerFailure with an error message.
  ServerFailure(this.errorMessage);

  /// The error message describing the server failure.
  final String errorMessage;

  /// Returns the list of properties for equality comparison.
  @override
  List<Object> get props => <Object>[errorMessage];

  /// Converts the failure to a readable string format.
  @override
  String toString() => 'ServerFailure{errorMessage: $errorMessage}';
}

/// Represents a cache failure, extending the Failure class.
class CacheFailure extends Failure {
  /// Initializes the CacheFailure with an error message.
  CacheFailure(this.errorMessage);

  /// The error message describing the cache failure.
  final String errorMessage;

  /// Returns the list of properties for equality comparison.
  @override
  List<Object> get props => <Object>[errorMessage];

  /// Converts the failure to a readable string format.
  @override
  String toString() => 'CacheFailure{errorMessage: $errorMessage}';
}

/// Represents a connection failure, extending the Failure class.
class ConnectionFailure extends Failure {
  /// The error message indicating a connection failure.
  final String errorMessage = messageConnectionFailure;

  /// Returns the list of properties for equality comparison.
  @override
  List<Object> get props => <Object>[errorMessage];

  /// Converts the failure to a readable string format.
  @override
  String toString() => 'ConnectionFailure{errorMessage: $errorMessage}';
}
