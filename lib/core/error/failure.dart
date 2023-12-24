import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LocationPermissionDeniedFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LocationServiceFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
