import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class GoogleSignInFailure extends Failure {
  const GoogleSignInFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

//regis

class RegistrationFailure extends Failure {
  const RegistrationFailure(super.message);
}

class LoginFailure extends Failure {
  const LoginFailure(super.message);
}
