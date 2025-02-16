/// A base class representing a failure with an optional error message.
/// This class can be extended to create specific types of failures.
class Failure {
  final String? message;

  Failure({this.message});
}

/// A class representing a server failure, extending the [Failure] class.
/// This class can be used to indicate errors that occur due to server issues.
class ServerFailure extends Failure {
  ServerFailure({super.message});
}